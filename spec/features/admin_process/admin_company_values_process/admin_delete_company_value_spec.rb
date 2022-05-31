require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin deleted company value', type: :feature do
  let(:admin) { create(:admin) }
  let!(:company_value) { create(:company_value) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Succes' do
    click_link 'Manage Company values'
    expect(page).to have_current_path(admins_company_values_path)
    click_link 'Destroy'
    expect(page).to have_content 'Company value was successfully destroyed.'
    expect(page).to have_current_path(admins_company_values_path)
  end
end
