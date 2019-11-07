# In this module we collecting methods for Header page of VN
require 'capybara/cucumber'


module VN_HeaderPage
  extend Capybara::DSL
  extend RSpec::Matchers

  HEADER_PREFIX = "venus:header:"

  def self.my_account_icon_click
    p  "I am expect account icon"
    account_icon_name = "account_icon"
    account_icon_locator = "(//button[@aria-label='Account'])[1]"

    # page.assert_selector(:xpath, m_ta(HEADER_PREFIX + account_icon_name, account_icon_locator)) #analyzer works
    page.assert_selector(:xpath, account_icon_locator) #analyzer works
    p  'I see account icon in header'
    find(:xpath, m_ta(HEADER_PREFIX + account_icon_name, account_icon_locator)).click
    find(:xpath, "(//button[@aria-label='Account'])[1]").click
    p  "Account icon clicked"
  end

  def self.logo_click
    # find(:xpath, m_ta(HEADER_PREFIX + 'logo', "//span[text()='Venus']/parent::a")).click
    find(:xpath, "//span[text()='Venus']/parent::a").click
    p  "After click on logo I was navigated to: #{URI.parse(current_url)}"
  end

  def self.navigate_to_category_from_carousel(carousel_element_name)
    carousel_element_text = vn_get_main_carousel_elements(carousel_element_name)
    find(:xpath, "//a[@data-th='topNavClicked']//span[text()=\"#{carousel_element_text}\"]").click
    # find(:xpath, m_ta(HEADER_PREFIX + carousel_element_name,
    #                 %{//a[@data-th="topNavClicked"]//span[text()="#{carousel_element_text}"]})).click
    p "I've clicked #{carousel_element_text}"
  end

  def self.hamburger_icon_click
    find(:xpath, m_ta(HEADER_PREFIX + 'hamburger_menu_icon', "//button[@aria-label='Menu']")).click
    p  "I've clicked on Hamburger icon in header"
  end

  def self.search_icon_click
    page.assert_selector(:xpath, m_ta(HEADER_PREFIX + "search_icon", "//button[@aria-label='Search']"))
    find(:xpath, m_ta(HEADER_PREFIX + "search_icon", "//button[@aria-label='Search']")).click
    p  "I've clicked search icon in header"
    page.assert_selector(:xpath, "//div[@id='search-popup--moovweb']")
    p  "I am on search modal via header icon"
  end

  def self.cart_icon_click
    page.assert_selector(:xpath, m_ta(HEADER_PREFIX + "cart_icon", "//button[@aria-label='Cart']"))
    #used because too slow paypal connection
    set_page_timeout(15)
    begin
      find(:xpath, m_ta(HEADER_PREFIX + "cart_icon", "//button[@aria-label='Cart']")).click
    rescue Exception
      page.execute_script("window.stop();")
    ensure
      set_page_timeout(60)
    end
    p  "I've clicked on cart icon in header"
  end


  def self.expect_header_account_modal (content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    locators_to_check_on_page = vn_get_account_options_modal_elements
    element_locator = locators_to_check_on_page[content_name_to_check]
    VN_HeaderPage.wait_header_account_modal
    if content_name_to_check == 'header_account_modal_content'
      locators_to_check_on_page.each do |(name, locator)|
        # page.assert_selector(:xpath, m_ta(HEADER_PREFIX + name, locator)) //analyzer works
        page.assert_selector(:xpath,  locator)
        p locator
        p "#{HEADER_PREFIX + name}"
        p  "I see #{name} element on footer modal page"
      end
    else
      page.assert_selector(:xpath, m_ta(HEADER_PREFIX + content_name_to_check, element_locator))
      p  "I see #{content_name_to_check} element on footer modal page"
    end
  end


  def self.click_element_on_header_account_modal(element_name_to_click)
    footer_elements = vn_get_account_options_modal_elements
    element_locator = footer_elements[element_name_to_click]
    p element_locator
    p "ta: #{HEADER_PREFIX}#{element_name_to_click}"
    # find(:xpath, m_ta(HEADER_PREFIX + element_name_to_click, element_locator)).click
    find(:xpath, element_locator).click
    p "I've clicked #{element_name_to_click}"
  end

  def self.wait_header_account_modal
    if page.has_xpath?("(//*[@id='simple-menu']//ul[@role='menu'])[1]")
      p   "Account icon modal is opened. I see modal"
    else
      loop do
        sleep 5
        find(:xpath, "(//button[@aria-label='Account'])[1]").click
        break if page.has_xpath?("(//*[@id='simple-menu']//ul[@role='menu'])[1]")
      end
      p   "Account icon modal is opened. I see modal"
      end
    end

end