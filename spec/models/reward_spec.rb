require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe 'validations' do
    subject { build(:reward) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.not_to allow_value('').for(:title) }
    it { is_expected.not_to allow_value('').for(:description) }
    it { is_expected.not_to allow_value(0).for(:price) }
  end
end
