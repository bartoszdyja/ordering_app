class Meal < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  validates :name, :price, :user_id, :order_id, presence: true
end
