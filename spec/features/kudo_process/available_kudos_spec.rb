require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The available kudos process', type: :feature do
  let(:current_employee) { build(:employee) }
  let!(:employee) { create(:employee) }

  before do
    visit new_employee_session_path
  end

  it 'Success' do
    within('nav') do
      click_link 'Sign up'
    end
    fill_in 'Email', with: current_employee.email
    fill_in 'Password', with: current_employee.password
    fill_in 'Password confirmation', with: current_employee.password
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content 'Number of available kudos: 10'
    click_link 'New Kudo'
    fill_in 'Title', with: 'Test title'
    fill_in 'Content', with: 'Test content'
    select(employee.email, from: 'Receiver')
    click_button 'Create Kudo'
    expect(page).to have_content 'Kudo was successfully created.'
    expect(page).to have_current_path(kudos_path)
    expect(page).to have_content 'Number of available kudos: 9'
    click_link 'Destroy'
    expect(page).to have_content 'Kudo was successfully destroyed.'
    expect(page).to have_current_path(kudos_path)
    expect(page).to have_content 'Number of available kudos: 10'
  end
end
