class OrdersController < ApplicationController
  before_action :authenticate_employee!

  def index
    @orders = Order.where(employee_id: current_employee.id).includes(:reward)
  end

  def show
    order
  end

  def new
    @rewards = Reward.all
  end

  def create
    @order = Order.new(**order_params, employee_id: current_employee.id)
    price = @order.reward.price
    if current_employee.earned_points - price >= 0
      if @order.save
        current_employee.update!(earned_points: current_employee.earned_points - price)
        redirect_to orders_path, notice: 'You bought a reward.'
      else
        redirect_to orders_path, notice: 'You can`t create order.'
      end
    else
      redirect_to new_order_path, notice: 'You dont`t have enough erned points to buy a rewards.'
    end
  end

  private

  def order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:reward_id)
  end
end
