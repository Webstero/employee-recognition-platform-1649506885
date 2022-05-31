require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin deleted employee', type: :feature do
  let(:admin) { create(:admin) }
  let!(:giver) { create(:employee) }
  let!(:receiver) { create(:employee) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Success' do
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
