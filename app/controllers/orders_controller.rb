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
    @order = Order.new(**order_params, employee: current_employee)
    ::Orders::CreateService.new.call(order: @order, employee: current_employee)
    flash[:notice] = 'You bought a reward.'
    redirect_to orders_path
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = e.to_s
    redirect_to orders_path
  rescue ::Orders::EarnedPointsException => e
    flash[:error] = e.to_s
    redirect_to new_order_path
  end

  private

  def order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:reward_id)
  end
end
