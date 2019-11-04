# In this module we collecting methods for CustomerCare  page of VN
require 'capybara/cucumber'




module VN_CustomerCarePage
  extend Capybara::DSL
  extend RSpec::Matchers

  CUSTOMER_CARE_PREFIX = "venus:customer_care_page:"

  def  self.expect_content_on_customer_care_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check == 'customer_care_page_content'
      locators_to_check_on_page = vn_get_customer_care_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, m_ta(CUSTOMER_CARE_PREFIX + name, locator))
        p  "I see #{name} element on contact us page"
      end
    end
  end
end