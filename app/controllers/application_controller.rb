class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def not_authenticated
    render json: { errors: ["Login required"] }, status: :unauthorized
  end
end
