require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Employee checking constant price of bougth rewards', type: :feature do
  let!(:reward) { create(:reward, price: 1) }
  let!(:employee) { create(:employee, earned_points: 1) }
  let!(:admin) { create(:admin) }
  let!(:order) { create(:order, reward_id: reward.id, employee_id: employee.id, price: reward.price) }

  before do
    sign_in employee
    visit orders_path
  end

  it 'Success' do
    expect(page).to have_text '1.0'

    click_link 'Sign out'

    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    click_link 'Manage Rewards'
    all('a', text: 'Edit')[0].click
    fill_in 'Price', with: '2.0'
    click_button 'Update Reward'
    expect(page).to have_content 'Reward was successfully updated.'
    expect(page).to have_current_path(admins_rewards_path)

    click_link 'Sign out'

    visit new_employee_session_path
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    click_button 'Log in'

    click_link 'My orders'
    expect(page).to have_text '1.0'
  end
end
