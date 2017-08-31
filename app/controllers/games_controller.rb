class GamesController < ApplicationController
  def index
    @games = game.all
  end

  def show
    @game = game.find(params[:id])
  end

  def new
    @game = game.new
  end

  def create
    @game = game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def edit
    @game = game.find(params[:id])
  end

  def update
    @game = game.find(params[:id])

    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game = game.find(params[:id])
    @game.destroy

    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:date, :location, :, :user_id)
  end

end
