require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin deleted reward', type: :feature do
  let(:admin) { create(:admin) }
  let!(:reward) { create(:reward) }

  before do
    visit root_path
  end

  it 'Success' do
    click_link 'Sign in as Admin'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_current_path(admins_root_path)
    click_link 'Manage Rewards'
    expect(page).to have_current_path(admins_rewards_path)
    click_link('Destroy')
    expect(page).to have_content 'Reward was successfully destroyed.'
    expect(page).to have_current_path(admins_rewards_path)
  end
end
