require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin listing reward', type: :feature do
  let(:admin) { create(:admin) }
  let!(:reward) { create(:reward) }
  let!(:second_reward) { create(:reward) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Success' do
    click_link 'Manage Rewards'
    expect(page).to have_current_path(admins_rewards_path)
    expect(page).to have_text reward.id
    expect(page).to have_text reward.title
    expect(page).to have_text reward.description
    expect(page).to have_text reward.price
    expect(page).to have_text reward.created_at.strftime('%F')
    expect(page).to have_text second_reward.id
    expect(page).to have_text second_reward.title
    expect(page).to have_text second_reward.description
    expect(page).to have_text second_reward.price
    expect(page).to have_text second_reward.created_at.strftime('%F')
  end
end
