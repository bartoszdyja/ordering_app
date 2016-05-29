class Api::MealsController < ApplicationController
  before_filter :set_current_user, :authenticate_user!
  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    @order = Order.find(@meal.order_id)
    if @meal.save
      render json: @order
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :price, :order_id)
  end
end
