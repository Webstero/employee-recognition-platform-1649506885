require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Admin delete kudo', type: :feature do
  let(:admin) { create(:admin) }
  let!(:receiver) { create(:employee, earned_points: 1) }
  let!(:kudo) { create(:kudo, receiver_id: receiver.id) }

  before do
    sign_in admin
    visit admins_root_path
  end

  it 'Success' do
    click_link 'Manage Kudos'
    expect(page).to have_current_path(admins_kudos_path)
    click_link 'Destroy'
    expect(page).to have_content 'Kudo was successfully destroyed.'
    expect(page).to have_current_path(admins_kudos_path)
  end
end
