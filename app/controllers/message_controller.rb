class MessageController < ApplicationController
 skip_before_action :verify_authenticity_token

  def send_message
    boot_twilio
    Player.all.each do |player|
      @client.messages.create(
        from: '+16195676513',
        to: player.phone_number,
        body: "Your TEAM has a Game at LOCATION on DATE! Please reply 'yes' if you can make it, and 'no' if you are unable to come."
        )
    end
  end


  def receive_message
    message_body = params['Body']
    from_number = params['From']
    # accepted = Accept.open.joins(:player).where(phone_number: 'from_number').first
    case message_body
    when 'yes'
      response = 'OK! We will see you then!'
    when 'no'
      response = 'OK! thanks for letting us know.'
    else
      response = "I am sorry I did not catch that. Please reply 'yes' if you can make it, and 'no if you cannot."
    end
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
