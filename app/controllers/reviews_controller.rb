class ReviewsController < ApplicationController
  before_filter :set_review, :only => [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show   
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
 
  def update 
    respond_to do |format|
      if @review.update_attributes(params[:post])
        flash[:notice] = 'Review successfully updated'
        format.html { redirect_to(@review) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @review.errors, 
                     :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to(reviews_url) }
      format.xml { head :ok }
    end
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :description)
  end

end
