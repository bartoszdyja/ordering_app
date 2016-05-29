class Api::OrdersController < ApplicationController
  before_filter :set_current_user, :authenticate_user!

  def create
    @order = Order.new(order_params)
    if @order.save
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
  end

  def show
    @order = Order.includes(:meals).where(id: params[:id]).first
    render json: @order, include: {meals: {only: [:name, :price]}}
  end

  def index
    @orders = Order.all
    render json: @orders
  end

  def update
    @order = Order.find(params[:id])
    @order.increment!(:status, by=1) unless @order.status == 'delivered'
    render json: @order
  end

  private

  def order_params
    params.require(:order).permit(:name)
  end
end
