# In this module we collecting methods for Terms Of Use page of VN
require 'capybara/cucumber'




module VN_TermsOfUsePage
  extend Capybara::DSL
  extend RSpec::Matchers

  TERMS_OF_USE_PREFIX = "venus:terms_of_use_page:"

  def  self.expect_content_on_terms_of_use_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check == 'terms_of_use_page_content'
      locators_to_check_on_page = vn_get_terms_of_use_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, m_ta(TERMS_OF_USE_PREFIX + name, locator))
        p  "I see #{name} element on contact us page"
      end
    end
  end
end