require_relative 'base_page'

class ClientFormPage < BasePage

  first_name_input = ''
  last_name_input = ''
  save_btn = ''

  def fill_client_details(first_name, last_name)
    fill_in first_name_input with: first_name
    fill_in last_name_input with: last_name
  end

  def submit
    click_button save_btn
  end

end 
