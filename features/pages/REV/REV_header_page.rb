# In this module we collecting methods for Header page of REVOLVE
require 'capybara/cucumber'


module REV_HeaderPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.click_element_on_header(element_name)
  elements = rev_get_header_elements
    find(:xpath, elements[element_name]).click
    p "I've clicked #{element_name} on header"
  end

end