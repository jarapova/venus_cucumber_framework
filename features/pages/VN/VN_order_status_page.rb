# In this module we collecting methods for OrderStatus  page of VN
require 'capybara/cucumber'




module VN_OrderStatusPage
  extend Capybara::DSL
  extend RSpec::Matchers

  ORDER_STATUS_PAGE_PREFIX = "venus:order_status_page:"

  def  self.expect_content_on_order_status_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check == 'order_status_guest_page_content'
      page.assert_selector(:id, m_ta(ORDER_STATUS_PAGE_PREFIX + "email_input",
                                   "ctl00_Body1_loginemail"))
      page.assert_selector(:id, m_ta(ORDER_STATUS_PAGE_PREFIX + "password_input",
                                   "ctl00_Body1_loginpassword"))
      p  "I am on login page as expected. As order status page is only for signed in user."
    end
  end
end