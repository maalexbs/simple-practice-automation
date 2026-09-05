require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'dotenv/load' 
require 'faker'

# 1. Register Selenium Chrome Driver (Supports Headless mode via ENV)
Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  
  # Standard stability flags for automated Chrome execution
  options.add_argument('--start-maximized')
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')

  # Enable headless execution if HEADLESS=true environment variable is set
  options.add_argument('--headless=new') if ENV['HEADLESS'] == 'true'

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: options
  )
end

# 2. Configure Capybara Settings
Capybara.configure do |config|
  config.default_driver = :chrome
  config.javascript_driver = :chrome
  
  # Base URL so you can use relative paths like visit('/login')
  config.app_host = ENV['BASE_URL'] || 'https://app.simplepractice.com'
  
  # Implicit dynamic wait threshold before failing element searches
  config.default_max_wait_time = 10 
  
  # Match exact visible text when checking elements
  config.ignore_hidden_elements = true
end

# 3. Configure RSpec Test Runner Hooks
RSpec.configure do |config|
  # Reset browser session after each test spec to maintain test isolation
  config.after(:each) do
    Capybara.reset_sessions!
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end