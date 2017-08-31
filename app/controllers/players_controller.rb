class PlayersController < ApplicationController
  def index
     @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player, notice: "#{@player.first_name} #{@player.last_name} was successfully added."
    else
      render :new, status: 422
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
      @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to @player
    else
      render 'edit'
    end
  end

  def delete
    player = Player.find(params[:id])
    player.destroy
    redirect_to players_url, notice: 'Player was successfully removed.'
  end

  def show
    @player = Player.find(params[:id])
  end

  private
    def player_params
      params.require(:player).permit(:first_name, :last_name, :phone_number)
    end
end
