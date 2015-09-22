class DinosaursController < ApplicationController
  def index
    @dinosaurs = Dinosaur.all
  end

  def show
    @dinosaur = Dinosaur.find(params[:id])
    @review = Review.new
  end
  def destroy
    @dinosaur = Dinosaur.find(params[:id])
    @review = @dinosaur.reviews.find(params[:id])
    @review.destroy
    flash[:notice] = "Review deleted!"
    redirect_to dinosaur_path(@review.dinosaur_id)
  end

end
