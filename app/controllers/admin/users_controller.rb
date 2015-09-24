class Admin::UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
  end

  private
  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("You don't have privileges to do that.")
    end
  end
end
