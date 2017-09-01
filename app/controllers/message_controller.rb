class MessageController < ApplicationController
 skip_before_action :verify_authenticity_token

  def send_message
    game = Game.all.chronological.first
    boot_twilio
    Player.all.each do |player|
      @client.messages.create(
        from: '+16195676513',
        to: player.phone_number,
        body: "Your #{player.teams.name} has a Game at #{game.location} on #{game.date}! Please reply 'yes' if you can make it, and 'no' if you are unable to come."
        )
    end
  end


  def receive_message
    message_body = (params['Body'] || '').downcase
    from_number = params['From']
    player = Player.find_by(phone_number: from_number.slice(1..-1))
    game = player.games.chronological.first
    availability = Availability.new(player: player, game: game)


    case message_body
    when 'yes'
      response = 'OK! We will see you then!'
      availability.can_participate = 'yes'
    when 'no'
      response = 'OK! thanks for letting us know.'
      availability.can_participate = 'no'
    else
      response = "I am sorry I did not catch that. Please reply 'yes' if you can make it, and 'no if you cannot."
    end

    availability.save!
    boot_twilio
    sms = @client.messages.create(
      from: '+16195676513',
      to: from_number,
      body: response
      )
  end

  private

  def boot_twilio
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
