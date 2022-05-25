class Reward < ApplicationRecord
  validates :title, :description, presence: true, allow_nil: false

  validates :price, numericality: { greater_than_or_equal_to: 1 }, presence: true, allow_nil: false
end
