class Kudo < ApplicationRecord
  belongs_to :giver, class_name: 'Employee'
  belongs_to :receiver, class_name: 'Employee'
  belongs_to :company_value

  validates :title, :content, presence: true

  validate :giver_other_than_receiver

  private

  def giver_other_than_receiver
    errors.add(:base, 'Receiver must be different than giver') unless giver_id != receiver_id
  end
end
