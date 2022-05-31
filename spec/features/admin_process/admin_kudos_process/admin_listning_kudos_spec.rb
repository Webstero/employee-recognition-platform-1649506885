require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin listing kudos', type: :feature do
  let(:admin) { create(:admin) }
  let!(:kudo) { create(:kudo) }
  let!(:second_kudo) { create(:kudo) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Success' do
    click_link 'Manage Kudos'
    expect(page).to have_current_path(admins_kudos_path)
    expect(page).to have_text kudo.id
    expect(page).to have_text kudo.title
    expect(page).to have_text kudo.content
    expect(page).to have_text kudo.giver.email
    expect(page).to have_text kudo.receiver.email
    expect(page).to have_text kudo.company_value.title
    expect(page).to have_text second_kudo.id
    expect(page).to have_text second_kudo.title
    expect(page).to have_text second_kudo.content
    expect(page).to have_text second_kudo.giver.email
    expect(page).to have_text second_kudo.receiver.email
    expect(page).to have_text second_kudo.company_value.title
  end
end
