class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :number_of_available_kudos, numericality: { greater_than_or_equal_to: 0 }

  has_many :giver_kudos, class_name: 'Kudo', foreign_key: 'giver_id', dependent: :destroy, inverse_of: :giver
  has_many :receiver_kudos, class_name: 'Kudo', foreign_key: 'receiver_id', dependent: :destroy, inverse_of: :receiver

  scope :all_without, ->(ids) { where.not(id: ids) }
end
