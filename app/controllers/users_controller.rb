class UsersController < ApplicationController
  before_action :require_login

  def show
    render json: { user: current_user }
  end

  def update
    current_user.update!(user_params)
    render json: { user: current_user }
  end

  private

  def user_params
    params.require(:user).permit(:email, :username)
  end
end
