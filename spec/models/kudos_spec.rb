require 'rails_helper'

RSpec.describe Kudo, type: :model do
  context 'when validation is successful' do
    it 'returns true' do
      expect(build(:kudo)).to be_valid
    end
  end

  context 'when validation is unsuccessful' do
    it 'is not valid without a title' do
      expect(build(:kudo, title: '')).not_to be_valid
    end

    it 'is not valid without a content' do
      expect(build(:kudo, content: '')).not_to be_valid
    end
  end
end
