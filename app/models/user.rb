class User < ActiveRecord::Base
  has_many :meals
  has_many :orders, through: :meals
  validates :email, :username, presence: true

  def self.from_oauth(profile)
    user = User.where(email: profile['email']).first_or_create do |u|
      u.username = profile['first_name'] || profile['login']
    end
    payload = {id: user.id}
    JWT.encode payload, Rails.application.secrets.jwt_secret, 'HS256'
  end
end
