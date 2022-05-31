require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin show employee', type: :feature do
  let(:admin) { create(:admin) }
  let!(:employee) { create(:employee) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Success' do
    click_link 'Manage Employees'
    expect(page).to have_current_path(admins_employees_path)
    click_link 'Show'
    expect(page).to have_current_path(admins_employee_path(employee))
    expect(page).to have_text employee.email
    expect(page).to have_text employee.id
    expect(page).to have_text employee.number_of_available_kudos
    click_link 'Back'
    expect(page).to have_current_path(admins_employees_path)
  end
end
