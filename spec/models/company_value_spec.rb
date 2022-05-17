require 'rails_helper'

# RSpec.describe CompanyValue, type: :model do
#   let(:company_value) { create(:company_value) }

#   context 'when validation is successful' do
#     it 'returns true' do
#       expect(build(:company_value)).to be_valid
#     end
#   end

#   context 'when validation is unsuccessful' do
#     it 'is not valid with title as blank' do
#       expect(build(:company_value, title: '')).not_to be_valid
#     end

#     it 'is not valid with the same title' do
#       expect(build(:company_value, title: company_value.title) ).not_to be_valid
#     end
#   end
# end

RSpec.describe CompanyValue, type: :model do
  describe 'validations' do
    subject { build(:company_value) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end
end
