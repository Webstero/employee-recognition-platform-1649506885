class Order < ApplicationRecord
  belongs_to :employee
  belongs_to :reward

  after_destroy :return_payment

  private

  def return_payment
    employee.update!(earned_points: employee.earned_points + reward.price)
  end
end
