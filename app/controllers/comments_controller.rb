class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.review = review

    if @comment.save
      flash[:notice] = "Comment Added!"
      redirect_to dinosaur_path(dinosaur)
    else
      flash[:errors] = @comment.errors.full_messages.join(". ")
      redirect_to dinosaur_path(dinosaur)
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(
      :body,
      :review_id).merge(
        user_id: current_user.id,
        review_id: review
    )
  end

  def review
    Review.find(params[:review_id])
  end

  def dinosaur
    review.dinosaur
  end
end
