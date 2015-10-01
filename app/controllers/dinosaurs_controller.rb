class DinosaursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @dinosaurs = Dinosaur.order(:name).page params[:page]

    if params[:search]
      @dinosaurs = Dinosaur.search(params[:search]).page params[:page]
    else
      @dinosaurs = Dinosaur.order(:name).page params[:page]
    end
  end

  def show
    @dinosaur = Dinosaur.find(params[:id])
    @new_review = Review.new
    @reviews = @dinosaur.reviews.order(created_at: :desc).page params[:page]
    @comment = Comment.new
    @review = Review.new
    @comments = @review.comments
  end

  def new
    @dinosaur = Dinosaur.new
  end

  def create
    @dinosaur = Dinosaur.new(dinosaur_params)

    if @dinosaur.save
      flash[:notice] = 'Dinosaur added!'
      redirect_to @dinosaur
    else
      flash[:errors] = @dinosaur.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @dinosaur = Dinosaur.find(params[:id])
    if current_user != @dinosaur.user
      flash[:errors] = "You can't edit this dinosaur!"
      redirect_to @dinosaur
    end
  end

  def update
    @dinosaur = Dinosaur.find(params[:id])

    if current_user != @dinosaur.user
      flash[:errors] = "You can't edit this dinosaur!"
      redirect_to @dinosaur
    end

    if @dinosaur.update(dinosaur_params)
      flash[:notice] = 'Dinosaur changed!'
      redirect_to @dinosaur
    else
      flash[:errors] = @dinosaur.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @dinosaur = Dinosaur.find(params[:id])

    if (current_user != @dinosaur.user) && (!current_user.admin?)
      flash[:errors] = "You can't delete this dinosaur!"
      redirect_to @dinosaur
    end

    if @dinosaur.destroy
      flash[:notice] = 'Dinosaur extinctified!'
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
      :description,
      :dino_photo).merge(user_id: current_user.id)
  end
end
