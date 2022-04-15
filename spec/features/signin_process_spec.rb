require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The signin process', type: :feature do
  let(:employee) { create(:employee) }

  before do
    visit root_path
  end

  it 'Signing in with correct credentials' do
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_current_path(root_path)
  end

  it 'Signing without password' do
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: ''
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
    expect(page).to have_current_path(new_employee_session_path)
  end

  it 'Signing without email' do
    fill_in 'Email', with: ''
    fill_in 'Password', with: employee.password
    click_button 'Log in'
    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_current_path(new_employee_session_path)
  end
end
