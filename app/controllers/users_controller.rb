class UsersController < ApplicationController
  before_action :require_login

  def show
    render json: { user: current_user.slice(:email, :username) }
  end

  def update
    current_user.update!(user_params)
    render json: { user: current_user.slice(:email, :username) }
  end

  private

  def user_params
    params.require(:user).permit(:email, :username)
  end
end
