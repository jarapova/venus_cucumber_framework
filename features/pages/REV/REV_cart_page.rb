# In this module we collecting methods for cart page of REVOLVE
require 'capybara/cucumber'


module REV_CartPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.visit_home_page
    visit BASE_URL
    p  "I am on #{BASE_URL} home page"
    p  "REV_HomePage"
  end

end