# In this module we collecting methods for Privacy Policy page of VN
require 'capybara/cucumber'




module VN_PrivacyPolicyPage
  extend Capybara::DSL
  extend RSpec::Matchers

  PRIVACY_POLICY_PREFIX = "venus:privacy_policy_page:"

  def  self.expect_content_on_privacy_policy_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check == 'privacy_policy_page_content'
      locators_to_check_on_page = vn_get_privacy_policy_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, m_ta(PRIVACY_POLICY_PREFIX + name, locator))
        p  "I see #{name} element on contact us page"
      end
    end
  end
end