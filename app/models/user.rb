class User < ActiveRecord::Base
  def self.from_oauth(profile)
    user = User.where(email: profile['email']).first_or_create do |u|
      u.username = profile['first_name'] || profile['login']
    end
    JWT.encode user.id, Rails.application.secrets.jwt_secret, 'HS256'
  end
end
