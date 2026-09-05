#Feature test covering e2e Create and Validate Client workflow.
# Validates client creation for multiple statuses (Active and Prospective)
# and asserts visibility in the client index list. 

require 'spec_helper'
require_relative '../pages/login_page'
require_relative '../pages/components/client_modal'
require_relative '../pages/client_index_page'

RSpec.describe 'SimplePractice Client Creation Test', type: :feature do
  let(:login_page) { LoginPage.new }
  let(:client_modal) { ClientModalComponent.new }
  let(:client_index_page) {ClientIndexPage.new }

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
    it "creates a new client with '#{status}' status and verifies presence in the client list" do
    # Open the creation modal
    client_modal.click_create_client

    # Fill out the new client form
    client_data = client_modal.fill_and_submit_form(status: status)
    full_name = "#{client_data[:first_name]} #{client_data[:last_name]}"
    
    # Navigate to the Client menu and filter by the client data
    clients_page = ClientIndexPage.new
    clients_page.search_client_with_status(full_name, status)

    # Assert client is visible in the search results
    expect(clients_page).to have_client(full_name)
    end
  end
end