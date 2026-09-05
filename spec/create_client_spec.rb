require 'spec_helper'
require_relative '../pages/login_page'
require_relative '../pages/components/client_modal'

RSpec.describe 'SimplePractice Client Creation Test', type: :feature do
  let(:login_page) { LoginPage.new }
  let(:client_modal) { ClientModalComponent.new }

  before do
    # Loads the login page and logins with credentials
    login_page.load
    login_page.login(
      ENV['SIMPLEPRACTICE_USER'], 
      ENV['SIMPLEPRACTICE_PASSWORD']
    )

    # Verify login was successful
    expect(page).not_to have_current_path('/login')
  end

  # Parametrized test for client statuses 'Active' and 'Prospective'
  ['Active', 'Prospective'].each do |status|
    it "created a new client with '#{status}' status" do
    # Click the create client button
    client_modal.click_create_client

    # Fill out the new client form
    client_data = client_modal.fill_and_submit_form(status: status)
    sleep 5
    end
  end
end