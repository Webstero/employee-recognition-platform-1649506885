require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin listing employee', type: :feature do
  let(:admin) { create(:admin) }
  let!(:employee) { create(:employee) }

  before do
    visit new_employee_session_path
  end

  it 'Success' do
    click_link 'Sign in as Admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_current_path(admins_root_path)
    click_link 'Manage Employees'
    expect(page).to have_current_path(admins_employees_path)
    expect(page).to have_text employee.email
    expect(page).to have_text employee.id
    expect(page).to have_text employee.number_of_available_kudos
  end
end
