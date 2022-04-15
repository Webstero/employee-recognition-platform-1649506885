require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The remove process', type: :feature do
  let(:kudo) { create(:kudo) }

  before do
    visit root_path
  end

  it 'Remove Kudo as giver' do
    fill_in 'Email', with: Employee.find(kudo.giver_id).email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    click_link 'Destroy'
    expect(page).to have_content 'Kudo was successfully destroyed.'
    expect(page).to have_current_path(kudos_path)
  end

  it 'Can`t remove Kudo as receiver' do
    fill_in 'Email', with: Employee.find(kudo.receiver_id).email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).not_to have_link('Destroy')
    expect(page).to have_current_path(root_path)
  end
end
