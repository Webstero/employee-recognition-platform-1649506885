require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The edit process', type: :feature do
  let(:kudo) { create(:kudo) }

  before do
    visit new_employee_session_path
  end

  it 'Edit Kudo as giver with a change in the title' do
    fill_in 'Email', with: Employee.find(kudo.giver_id).email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Edit'
    fill_in 'Title', with: 'Change title'
    click_button 'Update Kudo'
    expect(page).to have_content 'Kudo was successfully updated.'
    expect(page).to have_current_path(kudo_path(kudo.id))
  end

  it 'Edit Kudo as giver with a change in the content' do
    fill_in 'Email', with: Employee.find(kudo.giver_id).email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Edit'
    fill_in 'Content', with: 'Change content'
    click_button 'Update Kudo'
    expect(page).to have_content 'Kudo was successfully updated.'
    expect(page).to have_current_path(kudo_path(kudo.id))
  end

  it 'Can`t edit Kudo as receiver' do
    fill_in 'Email', with: Employee.find(kudo.receiver_id).email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).not_to have_link('Edit')
    expect(page).to have_current_path(root_path)
  end
end
