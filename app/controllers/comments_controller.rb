class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @review = Review.find(params[:review_id])
    @dinosaur = @review.dinosaur
    @comment.review = @review

    if @comment.save
      flash[:notice] = "Comment Added!"
      redirect_to dinosaur_path(@dinosaur)
    else
      flash[:errors] = @comment.errors.full_messages.join(". ")
      redirect_to dinosaur_path(@dinosaur)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def comment_params
    params.require(:comment).permit(
      :body,
      :review_id).merge(
      user_id: current_user.id
    )
  end
end
