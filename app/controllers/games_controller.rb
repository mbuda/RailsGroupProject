class GamesController < ApplicationController
  before_action :set_game, :only => [:show, :edit, :update, :destroy]

  def index
    @games = Game.search(params[:search])
  end

  def new
    @game = Game.new
  end

  def show
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: "Saved game"
    else
      render action: 'new'
    end
  end

  def update
    if @game.update(game_params)
      flash[:notice] = "Game successfully updated"
      respond_to do |format|
        format.html { redirect_to game_path(@game) }
        format.xml { head :ok }
      end
    else
      format.html { render :action => :edit }
      format.xml { render :xml => @game.errors, :status => :unprocessable_entity }
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to games_path }
      format.xml { head :ok }
    end
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :release_date, :requirements, :genre, :pegi, :producent)
  end


end
