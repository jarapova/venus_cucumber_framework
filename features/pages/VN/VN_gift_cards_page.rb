# In this module we collecting methods for GidtCards  page of VN
require 'capybara/cucumber'




module VN_GiftCardsPage
  extend Capybara::DSL
  extend RSpec::Matchers

  GIFT_CARD_PREFIX = "venus:gift_card_page:"

  def  self.expect_content_on_gift_cards_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check == 'gift_cards_page_content'
      locators_to_check_on_page = vn_get_gift_cards_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, m_ta(GIFT_CARD_PREFIX + name, locator))
        p  "I see #{name} element on contact us page"
      end
      text_to_check_on_page = vn_get_gift_cards_page_text
      text_to_check_on_page.each do |(name, text)|
        page.assert_selector(:xpath, "//*[text()='#{text}']")
        p  "I see <#{name}> text element on card page"
      end
    end
  end
end