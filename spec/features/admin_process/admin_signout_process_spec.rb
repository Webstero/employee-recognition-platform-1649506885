require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The signout process as admin', type: :feature do
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
    click_link 'Sign out as Admin'
    expect(page).to have_current_path(new_employee_session_path)
  end
end
