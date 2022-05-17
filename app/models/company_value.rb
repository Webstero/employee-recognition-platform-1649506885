class CompanyValue < ApplicationRecord
  validates :title, presence: true, uniqueness: true, allow_nil: false
end
