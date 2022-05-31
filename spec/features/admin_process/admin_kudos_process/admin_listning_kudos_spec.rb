require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin listing kudos', type: :feature do
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
    expect(page).to have_text kudo.id
    expect(page).to have_text kudo.title
    expect(page).to have_text kudo.content
    expect(page).to have_text kudo.giver.email
    expect(page).to have_text kudo.receiver.email
    expect(page).to have_text kudo.company_value.title
  end
end
