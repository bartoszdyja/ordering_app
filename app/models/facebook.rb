class Facebook
  attr_reader :conn, :code, :access_token

  def initialize(code)
    @conn = Faraday.new('https://graph.facebook.com/')
    @code = code
    get_access_token
  end

  def get_access_token
    token_response = conn.get('/v2.3/oauth/access_token',
                              {client_id: Rails.application.secrets.facebook_id,
                               redirect_uri: 'http://localhost:3000/',
                               client_secret: Rails.application.secrets.facebook_secret,
                               code: code})
    @access_token = JSON.parse(token_response.body)['access_token']
  end

  def profile
    profile_response = conn.get('/me', {access_token: access_token})
    JSON.parse(profile_response.body)
  end

end
