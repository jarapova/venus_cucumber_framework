# In this module we collecting methods for account page of VN
require 'capybara/cucumber'


module VN_AccountPage
  extend Capybara::DSL
  extend RSpec::Matchers

  ACCOUNT_PAGE_PREFIX = "venus:account_page:"

  def self.expect_cart_page_content(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check.include? "_hash"
      item_index = content_name_to_check.sub("_hash", "")
      item_in_hash = $vn_test_items_list[item_index]
      item_in_wish_list = VN_AccountPage.get_product_parameters_on_wish_list_page
      p item_in_hash
      p item_in_wish_list
      expect(item_in_hash['product_sku']).to eq item_in_wish_list['product_sku']
      expect(item_in_hash['product_size_id']).to eq item_in_wish_list['product_size_id']
      expect(item_in_hash['product_name']).to eq item_in_wish_list['product_name']
      expect(item_in_hash['product_qty']).to eq item_in_wish_list['product_qty']
      p  "I see #{item_index} item with expected parameters on cart page"
    elsif content_name_to_check == 'wish_list_page_content'
      vn_get_account_wish_list_locators.each do |name, locator|
        page.assert_selector(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + name, locator))
        p "I see #{name} on wish list account tab"
      end
    end
  end

  def self.get_product_parameters_on_wish_list_page
    parameters_array = Hash.new
    name_locator="(//span[contains(@id,'ProductName')])[1]"
    sku_locator= "(//span[contains(@id,'ProductOptionSku')])[1]"
    size_locator= "(//span[contains(@id,'ProductSize')])[1]"
    qty_locator = "(//select[contains(@id,'Quantity')]//option[@selected='selected'])[1]"

    parameters_array['product_name'] = find(:xpath, name_locator).text
    parameters_array['product_sku'] = find(:xpath, sku_locator).text
    #TA BUG
    parameters_array['product_size_id'] = find(:xpath, size_locator).text
    p "Size: #{parameters_array['product_size_id']} locator: #{size_locator}"
    parameters_array['product_qty'] = find(:xpath, qty_locator).text

    return parameters_array
  end

  def self.expect_content_on_account_information_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    locators_to_check_on_page = vn_get_account_information_page_locators
    element_locator = locators_to_check_on_page[content_name_to_check]
    if content_name_to_check == 'account_information_page_content'
      locators_to_check_on_page.each do |(name, locator)|
        # page.assert_selector(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + name, locator)) //analyzer works
        page.assert_selector(:xpath,  locator)
        p  "I see #{name} element on footer modal page"
      end
    elsif content_name_to_check.include? 'welcome_back_account_page_content'
      element_name = 'welcome_back_message'
      welcome_back_message_locator = vn_get_account_welcome_back_page_locators[element_name]
      message_text = find(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + element_name, welcome_back_message_locator)).text
      credentials = get_user("user1")
      expected_text = "Welcome Back #{credentials['first_n']} #{credentials['last_n']}"
      expect(message_text.downcase).to eql(expected_text.downcase)
      p "Welcome message is correct"
    else
      page.assert_selector(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + content_name_to_check, element_locator))
      p  "I see #{content_name_to_check} element on footer modal page"
    end
  end

  def self.click_element_on_account_information_page(element_name_to_click)
    account_information_page_elements = vn_get_account_information_page_locators
    element_locator = account_information_page_elements[element_name_to_click]
    find(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + element_name_to_click, element_locator)).click
    p "I've clicked #{element_name_to_click}"
  end

  def self.expect_content_on_order_history_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    locators_to_check_on_page = vn_get_order_history_page_locators
    element_locator = locators_to_check_on_page[content_name_to_check]
    if content_name_to_check == 'order_history_page_content'
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + name, locator))
        p  "I see #{name} element on order history page"
      end
    else
      page.assert_selector(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + content_name_to_check, element_locator))
      p  "I see #{content_name_to_check} element on footer modal page"
    end
  end

  def self.expect_content_on_mail_options_page(content_name_to_check)
    locators_to_check_on_page = vn_get_order_mail_options_page_locators
  element_locator = locators_to_check_on_page[content_name_to_check]
  if content_name_to_check == 'mail_options_page_content'
    locators_to_check_on_page.each do |(name, locator)|
      page.assert_selector(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + name, locator))
      p  "I see #{name} element on footer modal page"
    end
  else
    page.assert_selector(:xpath, m_ta(content_name_to_check + ACCOUNT_PAGE_PREFIX, element_locator))
    p  "I see #{content_name_to_check} element on footer modal page"
  end
  end

  def self.click_element_account_navigation_tab(element_name_to_click)
    account_navigation_tab_elements = vn_get_account_navigation_tab_locators
    element_locator = account_navigation_tab_elements[element_name_to_click]
    find(:xpath, m_ta(ACCOUNT_PAGE_PREFIX + element_name_to_click, element_locator)).click
    p "I've clicked #{element_name_to_click}"
    VN_AccountPage.close_get_shipping_updates_popup
  end

def self.close_get_shipping_updates_popup
  sleep 3
  if page.has_xpath?("//h3[text()='Get Shipping Updates']") do
    p "I see shipping updates popup"
    find(:xpath, "//button[@class='dialog_close_button']").click
    sleep 2
    expect(page).not_to have_selector(:xpath, "//h3[text()='Get Shipping Updates']")
    p   "I've closed shipping updates popup"
  end
  else
    p   "I can't see shipping updates popup"
  end
 end

  def self.clear_wish_list_page
    if page.has_no_xpath?("//div[@class='block itemscont right10']")
      p   "wish list is clear"
    else
      loop do
        find(:xpath, "(//div[@class='block itemscont right10']//a[text()='Remove'])[1]").click
        sleep 3
        break if page.has_no_xpath?("//div[@class='block itemscont right10']")
      end
      p   "I've cleared wish list"
    end
  end

  def self.click_account_info

  end

  def self.click_move_to_bag_item(item_index)
    item_index = item_index.sub("_move_to_bag", "")
    item_hash = $vn_test_items_list[item_index]
    p "I want to add to bag #{item_hash['item_name']}"
    bag_button_locator = "//span[contains(@id, 'ProductName') and contains(text(), '#{item_hash['item_name']}')]/ancestor::div[@class='block itemscont right10']//a[text()='Move to bag']"
    find(:xpath, bag_button_locator).click
    p "Added"
  end

end