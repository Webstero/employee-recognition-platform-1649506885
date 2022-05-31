require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Employee listing reward', type: :feature do
  let(:employee) { create(:employee) }
  let!(:reward) { create(:reward) }
  let!(:second_reward) { create(:reward) }

  before do
    sign_in employee
    visit root_path
  end

  it 'Success' do
    click_link 'Rewards'
    expect(page).to have_current_path(rewards_path)
    expect(page).to have_text reward.id
    expect(page).to have_text reward.title
    expect(page).to have_text reward.price
    expect(page).to have_text reward.created_at
    expect(page).not_to have_text reward.description
    expect(page).to have_text second_reward.id
    expect(page).to have_text second_reward.title
    expect(page).to have_text second_reward.price
    expect(page).to have_text second_reward.created_at
    expect(page).not_to have_text second_reward.description
  end
end
