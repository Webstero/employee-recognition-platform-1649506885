require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The create process', type: :feature do
  let(:current_employee) { create(:employee) }
  let!(:employee) { create(:employee) }
  let!(:company_value) { create(:company_value) }

  before do
    sign_in current_employee
    visit root_path
  end

  it 'Create Kudo with correct credentials' do
    click_link 'New Kudo'
    fill_in 'Title', with: 'Test title'
    fill_in 'Content', with: 'Test content'
    select employee.email, from: 'kudo_receiver_id'
    select company_value.title, from: 'kudo_company_value_id'
    click_button 'Create Kudo'
    expect(page).to have_content 'Kudo was successfully created.'
    expect(page).to have_current_path(kudos_path)
  end

  it 'Create Kudo without a title' do
    click_link 'New Kudo'
    fill_in 'Title', with: ''
    fill_in 'Content', with: 'Test content'
    select employee.email, from: 'kudo_receiver_id'
    select company_value.title, from: 'kudo_company_value_id'
    click_button 'Create Kudo'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_current_path(kudos_path)
  end

  it 'Create Kudo without a content' do
    click_link 'New Kudo'
    fill_in 'Title', with: 'Test title'
    fill_in 'Content', with: ''
    select employee.email, from: 'kudo_receiver_id'
    select company_value.title, from: 'kudo_company_value_id'
    click_button 'Create Kudo'
    expect(page).to have_content "Content can't be blank"
    expect(page).to have_current_path(kudos_path)
  end
end
