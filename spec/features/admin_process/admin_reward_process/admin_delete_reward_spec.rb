require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin deleted reward', type: :feature do
  let(:admin) { create(:admin) }
  let!(:reward) { create(:reward) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Success' do
    click_link 'Manage Rewards'
    expect(page).to have_current_path(admins_rewards_path)
    click_link('Destroy')
    expect(page).to have_content 'Reward was successfully destroyed.'
    expect(page).to have_current_path(admins_rewards_path)
  end
end
