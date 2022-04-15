require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'when validation is successful' do
    it 'returns true' do
      expect(build(:employee)).to be_valid
    end
  end

  context 'when validation is unsuccessful' do
    it 'is not valid without a email' do
      expect(build(:employee, email: '')).not_to be_valid
    end

    it 'is not valid without a password' do
      expect(build(:employee, password: '')).not_to be_valid
    end
  end
end
