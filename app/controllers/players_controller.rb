class PlayersController < ApplicationController
  def index
     @players = Players.all
  end

  def new

  end

  def create
    @players = Player.new(player_params)

    @player.save
    redirect_to @player
  end

  def edit

  end

  def update

  end

  def delete

  end

  def show
    @player = Player.find(params[:id])
  end

  private
    def player_params
      params.require(:player).permit(:name, :number)
    end
end
