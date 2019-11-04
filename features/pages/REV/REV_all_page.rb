# In this module we collecting methods for all common page of REVOLVE
require 'capybara/cucumber'


module REV_AllPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.isRevolve?
    PWA == 'revolve'
  end

end