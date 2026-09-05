require_relative '../base_page'

class NavigationComponent < BasePage

  plus_menu_btn = ''
  create_client = ''
  left_nav_clients = ''

  def open_create_client
    find(plus_menu_btn).click
    find(create_client).click
  end

  def navigate_to_clients_page
    find(left_nav_clients).click
  end 

end 