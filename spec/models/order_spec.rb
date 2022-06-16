require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:reward) }
    it { is_expected.to belong_to(:employee) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.not_to allow_value(0).for(:price) }
  end
end
