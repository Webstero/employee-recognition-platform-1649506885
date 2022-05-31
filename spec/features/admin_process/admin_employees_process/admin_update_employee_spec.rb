require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin update employee', type: :feature do
  let(:admin) { create(:admin) }
  let!(:employee) { create(:employee) }

  before do
    visit new_employee_session_path
  end

  it 'Succes updating email and number of available kudos without changing password' do
    click_link 'Sign in as Admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_current_path(admins_root_path)
    click_link 'Manage Employees'
    expect(page).to have_current_path(admins_employees_path)
    click_link 'Edit'
    fill_in 'Email', with: 'changed_email@test.com'
    fill_in 'Number of available kudos', with: 11
    click_button 'Update Employee'
    expect(page).to have_content 'Employee was successfully updated.'
    click_link 'Sign out as Admin'
    expect(page).to have_current_path(new_employee_session_path)
    fill_in 'Email', with: 'changed_email@test.com'
    fill_in 'Password', with: employee.password
    click_button 'Log in'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content 'Number of available kudos: 11'
  end

  it 'Succes updating password' do
    click_link 'Sign in as Admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_current_path(admins_root_path)
    click_link 'Manage Employees'
    expect(page).to have_current_path(admins_employees_path)
    click_link 'Edit'
    fill_in 'Password', with: 'changed_password'
    click_button 'Update Employee'
    expect(page).to have_content 'Employee was successfully updated.'
    click_link 'Sign out as Admin'
    expect(page).to have_current_path(new_employee_session_path)
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: 'changed_password'
    click_button 'Log in'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content 'Number of available kudos: 10'
  end
end
