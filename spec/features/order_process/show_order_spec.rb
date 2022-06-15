require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Employee show order', type: :feature do
  let!(:reward) { create(:reward, price: 1) }
  let(:employee) { create(:employee, earned_points: 1) }

  before do
    sign_in employee
    visit orders_path
  end

  it 'Show own order' do
    click_link 'New Order'
    expect(page).to have_current_path(new_order_path)
    click_link 'Buy'
    expect(page).to have_current_path(orders_path)
    click_link 'Show'
    expect(page).to have_text Order.first.created_at
    expect(page).to have_text reward.title
    expect(page).to have_text reward.description
    expect(page).to have_text reward.price
  end
end
