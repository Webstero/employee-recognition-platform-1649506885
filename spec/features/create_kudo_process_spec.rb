require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The create process', type: :feature do
  let(:current_employee) { create(:employee) }
  let!(:employee) { create(:employee) }

  before do
    visit root_path
  end

  it 'Create Kudo with correct credentials' do
    fill_in 'Email', with: current_employee.email
    fill_in 'Password', with: current_employee.password
    click_button 'Log in'
    expect(page).to have_current_path(root_path)
    click_link 'New Kudo'
    fill_in 'Title', with: 'Test title'
    fill_in 'Content', with: 'Test content'
    select(employee.email, from: 'Receiver')
    click_button 'Create Kudo'
    expect(page).to have_content 'Kudo was successfully created.'
    expect(page).to have_current_path(kudos_path)
  end

  it 'Create Kudo without a title' do
    fill_in 'Email', with: current_employee.email
    fill_in 'Password', with: current_employee.password
    click_button 'Log in'
    click_link 'New Kudo'
    fill_in 'Title', with: ''
    fill_in 'Content', with: 'Test content'
    select(employee.email, from: 'Receiver')
    click_button 'Create Kudo'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_current_path(kudos_path)
  end

  it 'Create Kudo without a content' do
    fill_in 'Email', with: current_employee.email
    fill_in 'Password', with: current_employee.password
    click_button 'Log in'
    click_link 'New Kudo'
    fill_in 'Title', with: 'Test title'
    fill_in 'Content', with: ''
    select(employee.email, from: 'Receiver')
    click_button 'Create Kudo'
    expect(page).to have_content "Content can't be blank"
    expect(page).to have_current_path(kudos_path)
  end
end
