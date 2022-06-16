require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Employee checking constant price of bougth rewards', type: :feature do
  let!(:reward) { create(:reward, price: 1) }
  let!(:employee) { create(:employee, earned_points: 1) }
  let!(:order) { create(:order, reward_id: reward.id, employee_id: employee.id, price: reward.price) }

  before do
    sign_in employee
    visit orders_path
  end

  it 'Success' do
    expect(page).to have_text order.price
    reward.update!(price: 2.0)
    visit orders_path
    expect(page).to have_text order.price
  end
end
