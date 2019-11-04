# In this module we collecting methods for HamburgerMenu page of VN
require 'capybara/cucumber'
require 'capybara'
require 'allure-cucumber'


module VN_SignInPage
  extend Capybara::DSL
  extend RSpec::Matchers

  SIGN_IN_PREFIX = "venus:sign_in_page:"
  # find(:xpath, m_ta(HEADER_PREFIX + element_name_to_click, element_locator)).click

  def self.make_login_as (user_id)
    VN_AllPage.update_page
    VN_AllPage.update_page
    visit BASE_URL + '/secure/login.aspx'
    p  "I am on #{BASE_URL} login page"
    credentials = get_user(user_id)
    element_name = 'forgot_password_link'
    password_link_locator = vn_get_sign_in_page_locators[element_name]
    # page.assert_selector(:xpath, m_ta(SIGN_IN_PREFIX + element_name, password_link_locator))
    page.assert_selector(:xpath, password_link_locator)

    find(:id, m_ta(SIGN_IN_PREFIX + "email_field", "ctl00_Body1_loginemail")).set(credentials['email'])
    find(:id, m_ta(SIGN_IN_PREFIX + "password_field", "ctl00_Body1_loginpassword")).set(credentials['password'])
    find(:id, m_ta(SIGN_IN_PREFIX + "sign_in_button", "ctl00_Body1_loginbutton")).click
    p  "I've put credentials of #{user_id} and clicked to authorize"
  end

  def self.expect_content_sign_in_page(content_name_to_check)
    # VN_AllPage.update_page
    # VN_AllPage.update_page
    if content_name_to_check == 'sign_in_page_content'
      locators_to_check_on_page = vn_get_sign_in_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        # page.assert_selector(:xpath, m_ta(SIGN_IN_PREFIX + name, locator))//analyzer works
        page.assert_selector(:xpath, locator)
        p  "I see #{name} element on sign in page"
      end
    elsif content_name_to_check.include? 'password_lookup_content'
      expect_password_lookup_content
    end
  end

  def self.expect_password_lookup_content
    vn_get_forgot_password_modal_locators.each do |name, locator|
      page.assert_selector(:xpath, m_ta(SIGN_IN_PREFIX + name, locator))
      p "I see #{name} on forgot password modal"
    end
  end

  def self.click_element_sign_in_page(element_name_to_click)
    sign_in_page_elements = vn_get_sign_in_page_locators
    element_locator = sign_in_page_elements[element_name_to_click]
    find(:xpath, m_ta(SIGN_IN_PREFIX + element_name_to_click, element_locator)).click
    p   "I've clicked #{element_name_to_click}"
  end

  def self.click_cancel_forgot_password_modal
    cancel_button_locator = vn_get_forgot_password_modal_locators['cancel_button']
    find(:xpath, cancel_button_locator).click
    p "I closed Forgot password modal"
  end
end