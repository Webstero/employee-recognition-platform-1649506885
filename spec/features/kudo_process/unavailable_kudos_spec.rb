require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Can`t create kudo with unavailable number of kudos', type: :feature do
  let!(:receiver) { create(:employee) }
  let!(:giver) { create(:employee, number_of_available_kudos: 0) }
  let!(:company_value) { create(:company_value) }

  before do
    visit new_employee_session_path
  end

  it 'Success' do
    fill_in 'Email', with: giver.email
    fill_in 'Password', with: giver.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content 'Number of available kudos: 0'
    expect(page).not_to have_link 'New Kudo'
  end
end
