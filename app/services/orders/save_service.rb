module Orders
  class EarnedPointsException < StandardError; end

  class SaveService
    def call(order:, employee:)
      price = order.reward.price
      validate_earned_points(employee: employee, price: price)
      order.bought_reward = Reward.find(order.reward_id)

      ActiveRecord::Base.transaction do
        order.save!
        pay_for_order(employee: employee, price: price)
      end
    end

    private

    def validate_earned_points(employee:, price:)
      return unless price > employee.earned_points

      raise ::Orders::EarnedPointsException, 'You dont`t have enough erned points to buy a rewards.'
    end

    def pay_for_order(employee:, price:)
      employee.update!(earned_points: employee.earned_points - price)
    end
  end
end
