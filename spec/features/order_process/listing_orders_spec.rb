require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Employee listing buying rewards', type: :feature do
  let!(:reward) { create(:reward, price: 1) }
  let!(:second_reward) { create(:reward, price: 1) }
  let(:employee) { create(:employee, earned_points: 2) }

  before do
    sign_in employee
    visit orders_path
  end

  it 'Success' do
    expect(page).to have_content 'Number of earned points: 2'
    click_link 'New Order'
    expect(page).to have_current_path(new_order_path)
    all('a', text: 'Buy')[0].click
    expect(page).to have_current_path(orders_path)
    expect(page).to have_content 'You bought a reward.'
    expect(page).to have_content 'Number of earned points: 1'
    click_link 'New Order'
    all('a', text: 'Buy')[1].click
    expect(page).to have_content 'You bought a reward.'
    expect(page).to have_content 'Number of earned points: 0'
    expect(page).to have_current_path(orders_path)
    expect(page).to have_text reward.title
    expect(page).to have_text reward.description
    expect(page).to have_text reward.price
    expect(page).to have_text Order.first.created_at.strftime('%F')
    expect(page).to have_text second_reward.title
    expect(page).to have_text second_reward.description
    expect(page).to have_text second_reward.price
    expect(page).to have_text Order.second.created_at.strftime('%F')
  end
end
