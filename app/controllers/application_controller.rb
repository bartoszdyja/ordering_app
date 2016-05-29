class ApplicationController < ActionController::Base
  attr_reader :current_user
  protect_from_forgery with: :null_session

  def authenticate_user!
    unauthorized! unless current_user
  end

  def unauthorized!
    render json: 'Unauthorized', status: 401
  end

  def set_current_user
    token = request.headers['Authorization'].to_s.split(' ').last
    return unless token
    decoded_token = JWT.decode token, Rails.application.secrets.jwt_secret, true, { :algorithm => 'HS256' }
    @current_user = User.find(decoded_token.first['id'])
  end
end
