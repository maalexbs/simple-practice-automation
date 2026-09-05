require_relative 'base_page'

# Page object representing the Client Index page.
# Encapsulates interactions for list navigation, status-based filtering,
# search and client visibility assertions.
class ClientIndexPage < BasePage

  CLIENTS_MENU = 'a[aria-label="Clients"]'
  CLIENT_SEARCH_INPUT = 'input[name="utility-search"]'
  STATUS_FILTER_BTN = '//button[contains(., "Client status")]'
  STATUS_LIST = 'div.status-types'
  APPLY_BTN = '//button[normalize-space()="Apply"]'

  # Navigates to the Client Index via sidebard nav menu.
  # @return [void]
  def navitage_to_client_index
    find(CLIENTS_MENU).click
  end 

  # Searches a client by name.
  # @param name [Str] The name to search for.
  # @return [void]
  def search_client(name)
    find(CLIENT_SEARCH_INPUT, wait: 10).set(name)
  end

  # Filters the client list by client status.
  # @param status [Str] Status to filter by: Active, Prospective.
  # @return [void]
  def filter_by_status(status)
    find(:xpath, STATUS_FILTER_BTN).click

    within(STATUS_LIST) do
      find('span.label', text: status, exact_text: true).click
    end 

    find(:xpath, APPLY_BTN).click
  end 

  # Navigates to client list, applies non-default status filters,
  # and searches for the client name. 
  # @param name [Str] The full name of the client.
  # @param status [Str] The client status.
  # @return [void]
  def search_client_with_status(name, status)
    navitage_to_client_index
    filter_by_status(status) unless status == 'Active'
    search_client(name)
  end 

  # Checks if a given client name exists in the client list.
  # @param name [Str] The name of the client to verify.
  # @return [Boolean] true if client is found on the page within 5 secs. 
  def has_client?(name)
    has_content?(name, wait: 5)
  end

end 