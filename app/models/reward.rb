class Reward < ApplicationRecord
  validates :title, :description, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 1 }, presence: true, allow_nil: false

  has_many :orders, dependent: :destroy
end
