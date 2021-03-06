class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @dinosaurs = Dinosaur.where(user: @user)
  end

  def destroy
    @user = User.find(params[:id])
    if current_user != @user
      flash[:errors] = "You're not signed in as this user"
      redirect_to dinosaurs_path
    end
    @user.destroy
    flash[:success] = "Account deleted"
    redirect_to root_path
  end
end
