# In this module we collecting methods for category page of ST
require 'capybara/cucumber'


module ST_CategoryPage
  extend Capybara::DSL
  extend RSpec::Matchers
  def self.expect_subcategory_page_for(arg)
    page.assert_selector(:xpath, "//h1[text()='#{arg}']")
    page.assert_selector(:xpath, "//button[contains(.,'Filter')]")
    p  "I appear on subcategory #{arg} page"
    p  "And I see items:"
    ST_SearchModalPage.get_search_results
  end
end