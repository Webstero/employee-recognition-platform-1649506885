require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The signin process as admin', type: :feature do
  let(:admin) { create(:admin) }

  before do
    visit new_employee_session_path
  end

  it 'Signing in with correct credentials' do
    click_link 'Sign in as Admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_current_path(admins_root_path)
  end

  it 'Signing without password' do
    click_link 'Sign in as Admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: ''
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
    expect(page).to have_current_path(new_admin_session_path)
  end

  it 'Signing without email' do
    click_link 'Sign in as Admin'
    fill_in 'Email', with: ''
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_current_path(new_admin_session_path)
  end
end
