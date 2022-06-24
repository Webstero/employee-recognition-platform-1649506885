require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin listing bought rewards', type: :feature do
  let!(:reward) { create(:reward) }
  let!(:order) { create(:order, bought_reward: reward) }
  let!(:second_order) { create(:order, bought_reward: reward) }
  let!(:admin) { create(:admin) }

  before do
    sign_in admin
    visit admins_orders_path
  end

  it 'Success' do
    expect(page).to have_text order.employee.email
    expect(page).to have_text order.created_at.strftime('%F')
    expect(page).to have_text order.bought_reward.title
    expect(page).to have_text order.bought_reward.description
    expect(page).to have_text order.bought_reward.price
    expect(page).to have_text second_order.employee.email
    expect(page).to have_text second_order.created_at.strftime('%F')
    expect(page).to have_text second_order.bought_reward.title
    expect(page).to have_text second_order.bought_reward.description
    expect(page).to have_text second_order.bought_reward.price
  end
end
