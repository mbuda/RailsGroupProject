class ReviewsController < ApplicationController
  before_action :game

  def index
    @reviews = Review.all
  end

  def show
    @review = @game.reviews.find(params[:id])
  end

  def new
    @review = @game.reviews.build
  end

  def create
    @review = @game.reviews.new(review_params)
    if @review.save
      redirect_to [@game, @review], notice: "Saved review"
    else
      render action: 'new'
    end
  end

  def edit
    @review = @game.reviews.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = 'Review successfully updated'
      respond_to do |format|
        format.html { redirect_to game_review_path(@game, @review) }
        format.xml { head :ok }
      end
    else
      format.html { render :action => "edit" }
      format.xml { render :xml => @review.errors,
        :status => :unprocessable_entity }
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to game_reviews_path }
      format.xml { head :ok }
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :description)
  end

  def game
    @game = Game.find(params[:game_id])
  end
end
