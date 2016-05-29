class Api::OrdersController < ApplicationController
  # before_filter :authenticate_user!

  def create
    @order = Order.new(order_params)
    if @order.save
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
  end

  def show
    @order = Order.find(params[:id])
    render json: @order
  end

  private

  def order_params
    params.require(:order).permit(:name)
  end
end
