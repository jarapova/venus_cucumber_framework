# In this module we collecting methods for Footer modal  page of VN
require 'capybara/cucumber'


module VN_FooterModalPage
  extend Capybara::DSL
  extend RSpec::Matchers

  FOOTER_PREFIX = "venus:footer:"

  def self.expect_content_footer(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    locators_to_check_on_page = vn_get_footer_modal_page_locators
    element_locator = locators_to_check_on_page[content_name_to_check]
    if content_name_to_check == 'footer_modal_content'
    locators_to_check_on_page.each do |(name, locator)|
      page.assert_selector(:xpath, m_ta(FOOTER_PREFIX + name, locator))
        p "I see #{name} element on footer modal page"
    end
    else
      page.assert_selector(:xpath, m_ta(FOOTER_PREFIX + content_name_to_check, element_locator))
        p  "I see #{content_name_to_check} element on footer modal page"
    end
  end


  def self.click_item_footer(element_name_to_click)
      footer_elements = vn_get_footer_modal_page_locators
      element_locator = footer_elements[element_name_to_click]
      sleep 1
      find(:xpath, m_ta(FOOTER_PREFIX + element_name_to_click, element_locator)).click
      p "I've clicked #{element_name_to_click}"
    end
end


