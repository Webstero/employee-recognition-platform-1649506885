require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'The earned points', type: :feature do
  let(:receiver) { create(:employee) }

  before do
    sign_in receiver
    visit root_path
  end

  it 'Increase and decrease the number of earned points' do
    expect(page).to have_content 'Number of earned points: 0'
    create(:kudo, receiver: receiver)
    visit root_path
    expect(page).to have_content 'Number of earned points: 1'
    Kudo.first.destroy
    visit root_path
    expect(page).to have_content 'Number of earned points: 0'
  end
end
