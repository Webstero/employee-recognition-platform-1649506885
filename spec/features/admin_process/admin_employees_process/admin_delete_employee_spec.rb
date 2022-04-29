require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin deleted employee', type: :feature do
  let(:admin) { create(:admin) }
  let!(:giver) { create(:employee) }
  let!(:receiver) { create(:employee) }
  let!(:kudo) { create(:kudo, giver_id: giver.id, receiver_id: receiver.id) }

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
    click_link('Destroy', match: :first)
    expect(page).to have_content 'Employee was successfully destroyed.'
    expect(page).to have_current_path(admins_employees_path)
    click_link('Destroy', match: :first)
    expect(page).not_to have_text giver.email
    expect(page).to have_content 'Employee was successfully destroyed.'
    expect(page).to have_current_path(admins_employees_path)
    expect(page).not_to have_text receiver.email
  end
end
