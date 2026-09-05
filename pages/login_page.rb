require_relative 'base_page'

# Page object representing the authentication page.
# Encapsulates elements and interactions for credentials entry
# and sign-in verification.
class LoginPage < BasePage

  EMAIL_INPUT = '#user_email'
  PASSWORD_INPUT = '#user_password'
  SIGNIN_BTN = '#submitBtn'

  # Navigates to app root
  # @return [LoginPage] self for method chaining
  def load
    visit '/'
    self
  end

  # Fills in user credentials and signs in
  # @param email [Str] user email
  # @param password [Str] user password
  # @return [AppointmentsPage] Landing page object after log in  
  def login(email, password)
    find(EMAIL_INPUT, visible: true, wait:10).set(email)
    find(PASSWORD_INPUT).set(password)
    find(SIGNIN_BTN).click


  end

end 