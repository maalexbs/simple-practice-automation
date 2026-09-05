require_relative '../base_page'
require 'faker'

class ClientModalComponent < BasePage

  PLUS_BTN = '#spds-action-button-ghost-36'
  MODAL_CONTAINER = 'dialog.spds-modal-flyout' 
  FIRST_NAME      = 'input[name="firstName"]'      
  LAST_NAME       = 'input[name="lastName"]'
  STATUS_DROPDOWN = 'button.spds-input-dropdown-list-trigger'

  # Clicks the create client btn so that modal pops up
  def click_create_client
    find(PLUS_BTN).click
    click_button('Create client')
  end

  # Generates dynamic client data using Faker, fills out the Create Client form,
  # and submits it.
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
      
      #click_button('Continue')
    end

    # Return the generated values to use it for future checks
    { first_name: first_name, last_name: last_name, status: status }
  end
end