class Order < ApplicationRecord
  belongs_to :employee
  belongs_to :reward

  serialize :bought_reward
end
