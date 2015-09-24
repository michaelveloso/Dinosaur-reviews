class DinosaursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @dinosaurs = Dinosaur.all
  end

  def show
    @dinosaur = Dinosaur.find(params[:id])
    @new_review = Review.new
    @reviews = @dinosaur.reviews
    @comment = Comment.new
    @review = Review.new
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

  def edit
    @dinosaur = Dinosaur.find(params[:id])
  end

  def update
    @dinosaur = Dinosaur.find(params[:id])

    if @dinosaur.update(dinosaur_params)
      flash[:success] = 'Dinosaur changed!'
      redirect_to @dinosaur
    else
      flash[:errors] = @dinosaur.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @dinosaur = Dinosaur.find(params[:id])
    if @dinosaur.destroy
      flash[:success] = 'Dinosaur extinctified!'
      redirect_to dinosaurs_path
    else
      flash[:errors] = @dinosaur.errors.full_messages.join(', ')
      redirect_to @dinosaur
    end
  end

  private

  def dinosaur_params
    params.require(:dinosaur).permit(
      :name,
      :location_found,
      :info_url,
      :description).merge(user_id: current_user.id)
  end
end
