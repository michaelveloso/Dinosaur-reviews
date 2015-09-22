class ReviewsController < ApplicationController
  def new
    @reviews = Review.all
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
      render :'dinosaurs/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:body, :rating, :dinosaur_id)
  end
end
