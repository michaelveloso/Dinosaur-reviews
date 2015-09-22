class DinosaursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @dinosaurs = Dinosaur.all
  end

  def show
    @dinosaur = Dinosaur.find(params[:id])
  end
end
