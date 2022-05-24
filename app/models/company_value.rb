class CompanyValue < ApplicationRecord
  has_many :kudos, dependent: :destroy

  validates :title, presence: true, uniqueness: true, allow_nil: false
end
