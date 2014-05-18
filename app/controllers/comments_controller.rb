class CommentsController < ApplicationController
  def create
    @game = Game.find(params[:comment][:game_id])
    @review = Review.where('game_id = :game_id AND id = :review_id', params[:comment]).all.first
    @comment = @review.comments.new(comment_params)
    if @comment.save
      redirect_to game_review_path(@game, @review)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end

  def review
    @review = Review.find(params[:review_id])
  end

  def game
    @game = Game.find(params[@review.game_id])
  end
end

