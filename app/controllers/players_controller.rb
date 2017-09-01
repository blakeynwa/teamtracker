class PlayersController < ApplicationController
  def index
     @players = Player.all
  end

  def new
    @player = Player.new
    @teams = Team.all
  end

  def create
    @player = Player.new(player_params)
    @team = Team.find(player_params[:team_id])
    @team.memberships.create(player: @player)

    if @player.save
      redirect_to @player, notice: "#{@player.first_name} #{@player.last_name} was successfully added."
    else
      render :new, status: 422
    end
  end

  def edit
    @player = Player.find(params[:id])
    @teams = Team.all
  end

  def update
      @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to @player
    else
      render 'edit'
    end
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    redirect_to players_url, notice: 'Player was successfully removed.'
  end

  def show
    @player = Player.find(params[:id])
  end

  private
    def player_params
      params.require(:player).permit(:first_name, :last_name, :phone_number, :team_id)
    end
end
