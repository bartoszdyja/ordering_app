class Order < ActiveRecord::Base
  enum status: [ :active, :finalized, :ordered, :delivered ]
  has_many :meals
  has_many :users, through: :meals
end
