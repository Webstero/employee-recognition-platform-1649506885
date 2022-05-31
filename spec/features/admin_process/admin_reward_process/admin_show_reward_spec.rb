require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin show reward', type: :feature do
  let(:admin) { create(:admin) }
  let!(:reward) { create(:reward) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Success' do
    click_link 'Manage Rewards'
    expect(page).to have_current_path(admins_rewards_path)
    click_link 'Show'
    expect(page).to have_current_path(admins_reward_path(reward))
    expect(page).to have_text reward.id
    expect(page).to have_text reward.title
    expect(page).to have_text reward.description
    expect(page).to have_text reward.price
    expect(page).to have_text reward.created_at
    click_link 'Back'
    expect(page).to have_current_path(admins_rewards_path)
  end
end
