class AddOrderToMeal < ActiveRecord::Migration
  def change
    add_reference :meals, :order, index: true, foreign_key: true
  end
end
