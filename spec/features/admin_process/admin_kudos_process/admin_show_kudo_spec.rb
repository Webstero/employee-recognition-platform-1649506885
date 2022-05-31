require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin show kudo', type: :feature do
  let(:admin) { create(:admin) }
  let!(:kudo) { create(:kudo) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Success' do
    click_link 'Manage Kudos'
    expect(page).to have_current_path(admins_kudos_path)
    click_link 'Show'
    expect(page).to have_current_path(admins_kudo_path(kudo))
    click_link 'Back'
    expect(page).to have_current_path(admins_kudos_path)
  end
end
