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

  def edit
    @comment = Comment.find(params[:id])
    @review = Review.find(params[:review_id])
    if current_user != @comment.user
      flash[:errors] = "You can't edit this comment!"
      redirect_to @comment.review.dinosaur
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @review = Review.find(params[:review_id])
    if current_user != @comment.user
      flash[:errors] = "You can't edit this comment!"
      redirect_to @comment.review.dinosaur
    end
    if @comment.update_attributes(comment_params)
      flash[:notice] = "Comment updated!"
      redirect_to dinosaur_path(@comment.review.dinosaur_id)
    else
      flash[:errors] = @comment.errors.full_messages.join(". ")
      render :edit
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(
      :body).merge(
        user: current_user,
        review: review
    )
  end

  def review
    Review.find(params[:review_id])
  end

  def dinosaur
    review.dinosaur
  end
end
