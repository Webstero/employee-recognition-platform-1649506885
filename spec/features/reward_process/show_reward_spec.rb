require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Employee show reward', type: :feature do
  let(:employee) { create(:employee) }
  let!(:reward) { create(:reward) }

  before do
    sign_in employee
    visit root_path
  end

  it 'Success' do
    click_link 'Rewards'
    expect(page).to have_current_path(rewards_path)
    click_link 'Show'
    expect(page).to have_current_path(reward_path(reward))
    expect(page).to have_text reward.id
    expect(page).to have_text reward.title
    expect(page).to have_text reward.description
    expect(page).to have_text reward.price
    expect(page).to have_text reward.created_at
    click_link 'Back'
    expect(page).to have_current_path(rewards_path)
  end
end
