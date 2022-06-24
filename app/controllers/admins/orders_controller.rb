module Admins
  class OrdersController < AdminController
    def index
      @orders = Order.all.includes(:employee)
    end
  end
end
