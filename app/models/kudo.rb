class Kudo < ApplicationRecord
  belongs_to :giver, class_name: 'Employee'
  belongs_to :receiver, class_name: 'Employee'
  belongs_to :company_value

  after_create :decrease_available_kudos
  after_create :increase_earned_points

  after_destroy :increase_available_kudos
  after_destroy :decrease_earned_points

  validates :title, :content, presence: true

  validate :giver_other_than_receiver

  private

  def giver_other_than_receiver
    errors.add(:base, 'Receiver must be different than giver') unless giver_id != receiver_id
  end

  def decrease_available_kudos
    giver.update!(number_of_available_kudos: giver.number_of_available_kudos - 1)
  end

  def increase_available_kudos
    giver.update!(number_of_available_kudos: giver.number_of_available_kudos + 1)
  end

  def decrease_earned_points
    receiver.update!(earned_points: receiver.earned_points - 1)
  end

  def increase_earned_points
    receiver.update!(earned_points: receiver.earned_points + 1)
  end
end
