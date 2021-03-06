require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin update reward', type: :feature do
  let(:admin) { create(:admin) }
  let!(:reward) { create(:reward) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Succes' do
    click_link 'Manage Reward'
    expect(page).to have_current_path(admins_rewards_path)
    click_link 'Edit'
    fill_in 'Title', with: 'Changed title'
    click_button 'Update Reward'
    expect(page).to have_content 'Reward was successfully updated.'
    expect(page).to have_current_path(admins_rewards_path)
  end
end
