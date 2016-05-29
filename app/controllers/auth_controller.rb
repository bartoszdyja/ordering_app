class AuthController < ApplicationController
  def facebook
    facebook = Facebook.new(params[:code])
    user_token = User.from_oauth(facebook.profile)
    render json: { token: user_token }
  end

  def github
    render json: { token: 'rails github'  }
  end
end
