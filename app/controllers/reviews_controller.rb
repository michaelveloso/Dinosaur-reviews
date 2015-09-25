class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @new_review = Review.new(review_params)
    @dinosaur = Dinosaur.find(params[:dinosaur_id])
    @new_review.dinosaur = @dinosaur

    if @new_review.save
      flash[:notice] = "Review added!"
      redirect_to dinosaur_path(@dinosaur)
    else
      flash[:errors] = @new_review.errors.full_messages.join(". ")
      @reviews = @dinosaur.reviews.order(created_at: :desc).page params[:page]
      @new_review = Review.new
      @comment = Comment.new
      render 'dinosaurs/show'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:notice] = "Review Updated!"
      redirect_to dinosaur_path(@review.dinosaur_id)
    else
      flash[:errors] = @review.errors.full_messages.join('. ')
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review deleted!"
    redirect_to dinosaur_path(@review.dinosaur_id)
  end

  def upvote
    @review = Review.find(params[:id])
    @review.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @review = Review.find(params[:id])
    @review.downvote_by current_user
    redirect_to :back
  end

  def unvote
    @review = Review.find(params[:id])
    @review.unvote_by current_user
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(
      :body,
      :rating,
      :dinosaur_id).merge(user_id: current_user.id)
  end
end
