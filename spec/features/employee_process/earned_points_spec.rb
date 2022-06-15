require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The earned points', type: :feature do
  let!(:giver) { create(:employee) }
  let!(:receiver) { create(:employee) }
  let!(:company_value) { create(:company_value) }

  before do
    sign_in giver
    visit root_path
  end

  it 'Increase and decrease the number of earned points' do
    click_link 'New Kudo'
    fill_in 'Title', with: 'Test title'
    fill_in 'Content', with: 'Test content'
    select receiver.email, from: 'kudo_receiver_id'
    select company_value.title, from: 'kudo_company_value_id'
    click_button 'Create Kudo'
    expect(page).to have_content 'Kudo was successfully created.'
    expect(page).to have_current_path(kudos_path)

    click_link 'Sign out'

    fill_in 'Email', with: receiver.email
    fill_in 'Password', with: receiver.password
    click_button 'Log in'

    expect(page).to have_content 'Number of earned points: 1'

    click_link 'Sign out'

    fill_in 'Email', with: giver.email
    fill_in 'Password', with: giver.password
    click_button 'Log in'

    all('a', text: 'Destroy')[0].click

    click_link 'Sign out'

    fill_in 'Email', with: receiver.email
    fill_in 'Password', with: receiver.password
    click_button 'Log in'

    expect(page).to have_content 'Number of earned points: 0'
  end
end
