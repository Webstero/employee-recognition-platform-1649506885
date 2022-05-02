require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { create(:admin) }

  context 'when validation is successful' do
    it 'returns true' do
      expect(build(:admin)).to be_valid
    end
  end

  context 'when validation is unsuccessful' do
    it 'is not valid without a email' do
      expect(build(:admin, email: '')).not_to be_valid
    end

    it 'is not valid without a password' do
      expect(build(:admin, password: '')).not_to be_valid
    end

    it 'is not valid with the same email' do
      expect(build(:admin, email: admin.email)).not_to be_valid
    end
  end
end
