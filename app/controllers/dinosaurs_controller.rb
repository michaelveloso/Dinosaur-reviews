class DinosaursController < ApplicationController
  def index
  end

  def show
    @dinosaur = Dinosaur.find(params[:id])
  end
end
