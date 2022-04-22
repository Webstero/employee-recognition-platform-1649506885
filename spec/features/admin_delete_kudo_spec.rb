require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin delete kudo', type: :feature do
  let(:admin) { create(:admin) }
  let!(:kudo) { create(:kudo) }

  before do
    visit new_employee_session_path
  end

  it 'Success' do
    click_link 'Sign in as Admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_current_path(admins_root_path)
    click_link 'Manage Kudos'
    expect(page).to have_current_path(admins_kudos_path)
    click_link 'Destroy'
    expect(page).to have_content 'Kudo was successfully destroyed.'
    expect(page).to have_current_path(admins_kudos_path)
  end
end
