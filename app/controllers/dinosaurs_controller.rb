class DinosaursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @dinosaurs = Dinosaur.all
  end

  def show
    @dinosaur = Dinosaur.find(params[:id])
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

  private

  def dinosaur_params
    params.require(:dinosaur).permit(
      :name,
      :location_found,
      :info_url).merge(user_id: current_user.id)
  end

end
