require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin listing company value', type: :feature do
  let(:admin) { create(:admin) }
  let!(:company_value) { create(:company_value) }

  before do
    visit new_employee_session_path
  end

  it 'Succes' do
    click_link 'Sign in as Admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_current_path(admins_root_path)
    click_link 'Manage Company values'
    expect(page).to have_current_path(admins_company_values_path)
    expect(page).to have_text company_value.id
    expect(page).to have_text company_value.title
    expect(page).to have_text company_value.created_at
    expect(page).to have_text company_value.updated_at
  end
end
