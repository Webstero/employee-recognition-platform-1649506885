require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin create reward', type: :feature do
  let(:admin) { create(:admin) }
  let(:reward) { create(:reward) }

  before do
    sign_in admin
    visit admins_root_path
    click_link 'Manage Rewards'
    click_link 'New Reward'
  end

  it 'Create Reward with correct credentials' do
    fill_in 'Title', with: reward.title
    fill_in 'Description', with: reward.description
    fill_in 'Price', with: reward.price
    click_button 'Create Reward'
    expect(page).to have_content 'Reward was successfully created.'
    expect(page).to have_current_path(admins_rewards_path)
  end

  it 'Create Reward without a title' do
    fill_in 'Title', with: ''
    fill_in 'Description', with: reward.description
    fill_in 'Price', with: reward.price
    click_button 'Create Reward'
    expect(page).not_to have_content 'Reward was successfully created.'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_current_path(admins_rewards_path)
  end

  it 'Create Reward without a description' do
    fill_in 'Title', with: reward.title
    fill_in 'Description', with: ''
    fill_in 'Price', with: reward.price
    click_button 'Create Reward'
    expect(page).not_to have_content 'Reward was successfully created.'
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_current_path(admins_rewards_path)
  end

  it 'Create Reward with null or less price' do
    fill_in 'Title', with: reward.title
    fill_in 'Description', with: reward.description
    fill_in 'Price', with: 0
    click_button 'Create Reward'
    expect(page).not_to have_content 'Reward was successfully created.'
    expect(page).to have_content 'Price must be greater than or equal to 1'
    expect(page).to have_current_path(admins_rewards_path)
  end

  it 'Create Reward without price' do
    fill_in 'Title', with: reward.title
    fill_in 'Description', with: reward.description
    fill_in 'Price', with: nil
    click_button 'Create Reward'
    expect(page).not_to have_content 'Reward was successfully created.'
    expect(page).to have_content 'Price is not a number'
    expect(page).to have_content "Price can't be blank"
    expect(page).to have_current_path(admins_rewards_path)
  end
end
