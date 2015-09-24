class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @dinosaur = Dinosaur.find(params[:dinosaur_id])
    @review.dinosaur = @dinosaur

    if @review.save
      flash[:notice] = "Review added!"
      redirect_to dinosaur_path(@dinosaur)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      redirect_to dinosaur_path(@dinosaur)
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

  private

  def review_params
    params.require(:review).permit(
      :body,
      :rating,
      :dinosaur_id).merge(user_id: current_user.id)
  end
end
