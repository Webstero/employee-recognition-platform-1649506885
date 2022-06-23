class Order < ApplicationRecord
  belongs_to :employee
  belongs_to :reward
  validates :price, numericality: { greater_than_or_equal_to: 1 }, presence: true
end
