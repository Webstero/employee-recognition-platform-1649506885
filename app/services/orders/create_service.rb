module Orders
  class EarnedPointsException < StandardError; end

  class CreateService
    def call(order:, employee:)
      @price = order.reward.price
      not_enough_earned_points(employee: employee)
      ActiveRecord::Base.transaction do
        order.price = @price
        order.save!
        payment_for_order(employee: employee)
      end
    end

    private

    def not_enough_earned_points(employee:)
      return unless @price > employee.earned_points

      raise ::Orders::EarnedPointsException,
            'You dont`t have enough erned points to buy a rewards.'
    end

    def payment_for_order(employee:)
      employee.update!(earned_points: employee.earned_points - @price)
    end
  end
end
