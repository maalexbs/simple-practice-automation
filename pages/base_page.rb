class BasePage
  include Capybara::DSL

  # Waits for an element to appear in the DOM within a given timefrime.
  # @param locator [Str] The selector that identifies the element to wait for.
  # @param timeout [Int] Max wait duration in seconds.
  # @return The located element.
  def wait_for_element(locator, timeout: Capybara.default_max_wait_time)
    find(locator, wait: timeout)
  end

  def current_path
    URI.parse(page.current_url).path
  end

end