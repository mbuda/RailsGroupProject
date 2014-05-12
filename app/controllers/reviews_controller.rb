class ReviewsController < ApplicationController
 
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
      if @review.save
        redirect_to @review, notice: "Saved review"
      else
        render action: 'new'
      end
  end
  
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :description)
  end

end
