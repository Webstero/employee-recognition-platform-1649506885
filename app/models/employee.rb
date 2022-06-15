class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :number_of_available_kudos, numericality: { greater_than_or_equal_to: 0 }

  validates :earned_points, numericality: { greater_than_or_equal_to: 0 }

  has_many :giver_kudos, class_name: 'Kudo', foreign_key: 'giver_id', dependent: :destroy, inverse_of: :giver
  has_many :receiver_kudos, class_name: 'Kudo', foreign_key: 'receiver_id', dependent: :destroy, inverse_of: :receiver

  has_many :orders, dependent: :destroy

  scope :all_without, ->(ids) { where.not(id: ids) }

  def decrease_available_kudos
    update!(number_of_available_kudos: number_of_available_kudos - 1)
  end

  def increase_available_kudos
    update!(number_of_available_kudos: number_of_available_kudos + 1)
  end

  def decrease_earned_points
    update!(earned_points: earned_points - 1)
  end

  def increase_earned_points
    update!(earned_points: earned_points + 1)
  end
end
