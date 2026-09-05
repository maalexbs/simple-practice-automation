require_relative '../base_page'
require 'faker'

# Component object representing the Client Modal overlay.
# Provides form interactions, status selection and steps for
# creating a new client. 
class ClientModalComponent < BasePage

  PLUS_BTN = '#spds-action-button-ghost-36'
  MODAL_CONTAINER = 'dialog.spds-modal-flyout' 
  FIRST_NAME      = 'input[name="firstName"]'      
  LAST_NAME       = 'input[name="lastName"]'
  STATUS_DROPDOWN = 'button.spds-input-dropdown-list-trigger'

  # Opens the create client modalS
  # @return [void]
  def click_create_client
    find(PLUS_BTN).click
    click_button('Create client')
  end

  # Generates dynamic client data using Faker, fills out the Create Client form,
  # submits it and waits for the Client created validation.
  # @param first_name [Str] Client's first name (random).
  # @param last_name [Str] Client's last name (random).
  # @return [Hash] The generated client details containing :first_name, :last_name and :status.
  def fill_and_submit_form(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    status: 'Prospective'
  )
 
    # Fills in the info in the container
    within(MODAL_CONTAINER, wait: 10) do
     find(FIRST_NAME).set(first_name)
     find(LAST_NAME).set(last_name)
     find(STATUS_DROPDOWN).click
     find('[role="option"]', text: status).click 
      
      click_button('Continue')
    end

    # Checks for 'Client created' pop up
    has_text?('Client created', wait: 5)

    # Returns the generated names to use it for future checks
    { first_name: first_name, last_name: last_name, status: status }
  end
end