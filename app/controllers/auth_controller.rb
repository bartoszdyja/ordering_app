class AuthController < ApplicationController
  def facebook
    code = params[:code]
    conn = Faraday.new('https://graph.facebook.com/')
    response = conn.get('/v2.3/oauth/access_token', {client_id: Rails.application.secrets.facebook_id,
                                                     redirect_uri: 'http://localhost:3000/',
                                                     client_secret: Rails.application.secrets.facebook_secret,
                                                     code: code})
    token = JSON.parse(response.body)['access_token']
    render json: { token: token }
  end

  def github
    render json: { token: 'rails github'  }
  end
end
