class GamesController < ApplicationController

def new
@game = Game.new
end

def show
end

def create
    @game = Game.new(game_params)
      if @game.save
        redirect_to @game, notice: "Saved game"
      else
        render action: 'new'
      end
  end
  
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :release_date, :requirements, :genre, :PEGI, :producent)
  end


end
