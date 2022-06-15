require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Employee create order', type: :feature do
  let!(:reward) { create(:reward, price: 1) }
  let(:employee) { create(:employee, earned_points: 1) }

  before do
    sign_in employee
    visit orders_path
  end

  it 'Create Order using erned points' do
    expect(page).to have_content 'Number of earned points: 1'
    click_link 'New Order'
    expect(page).to have_current_path(new_order_path)
    all('a', text: 'Buy')[0].click
    expect(page).to have_current_path(orders_path)
    expect(page).to have_content 'You bought a reward.'
    expect(page).to have_content 'Number of earned points: 0'
    click_link 'New Order'
    all('a', text: 'Buy')[0].click
    expect(page).to have_content 'You dont`t have enough erned points to buy a rewards.'
  end
end
