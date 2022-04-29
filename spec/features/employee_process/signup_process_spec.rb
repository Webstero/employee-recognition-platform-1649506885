require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The signup process', type: :feature do
  let(:employee) { build(:employee) }
  let(:same_employee) { create(:employee) }

  before do
    visit new_employee_registration_path
  end

  it 'Signing up in with correct credentials' do
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    fill_in 'Password confirmation', with: employee.password
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_current_path(root_path)
  end

  it 'Signing up with the same email' do
    fill_in 'Email', with: same_employee.email
    fill_in 'Password', with: same_employee.password
    fill_in 'Password confirmation', with: same_employee.password
    click_button 'Sign up'
    expect(page).to have_content 'Email has already been taken'
  end

  it 'Signing up without a email' do
    fill_in 'Email', with: ''
    fill_in 'Password', with: employee.password
    fill_in 'Password confirmation', with: employee.password
    click_button 'Sign up'
    expect(page).to have_content 'Email can\'t be blank'
  end

  it 'Signing up without a password' do
    click_button 'Sign up'
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Password can\'t be blank'
  end

  it 'Signing up with diffrent password confirmation' do
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    fill_in 'Password confirmation', with: ''
    click_button 'Sign up'
    expect(page).to have_content 'Password confirmation doesn\'t match Password'
  end

  it 'Signing up with to short password' do
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: 'test'
    fill_in 'Password confirmation', with: 'test'
    click_button 'Sign up'
    expect(page).to have_content 'Password is too short (minimum is 6 characters)'
  end
end
