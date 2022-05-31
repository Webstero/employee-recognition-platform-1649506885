require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin listing employee', type: :feature do
  let(:admin) { create(:admin) }
  let!(:employee) { create(:employee) }
  let!(:second_employee) { create(:employee) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Success' do
    click_link 'Manage Employees'
    expect(page).to have_current_path(admins_employees_path)
    expect(page).to have_text employee.id
    expect(page).to have_text employee.email
    expect(page).to have_text employee.number_of_available_kudos
    expect(page).to have_text employee.created_at
    expect(page).to have_text employee.updated_at
    expect(page).to have_text second_employee.id
    expect(page).to have_text second_employee.email
    expect(page).to have_text second_employee.number_of_available_kudos
    expect(page).to have_text second_employee.created_at
    expect(page).to have_text second_employee.updated_at
  end
end
