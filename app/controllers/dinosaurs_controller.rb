class DinosaursController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

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

  def new
    @dinosaur = Dinosaur.new
  end

  def create
    @dinosaur = Dinosaur.new(dinosaur_params)

    if @dinosaur.save
      flash[:success] = 'Dinosaur added!'
      redirect_to @dinosaur
    else
      flash[:errors] = @dinosaur.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def dinosaur_params
    params.require(:dinosaur).permit(
      :name,
      :location_found,
      :info_url).merge(user_id: current_user.id)
  end
end
