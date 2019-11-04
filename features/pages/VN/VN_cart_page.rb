# In this module we collecting methods for cart page of VN
require 'capybara/cucumber'


module VN_CartPage
  extend Capybara::DSL
  extend RSpec::Matchers

  CART_PAGE_PREFIX = 'venus:cart_page:'
#Error, but new method(check_item_locator_value) added
# Not used method
  def self.check_element_with_value_on_cart_page(element_name, element_value)
    element=vn_get_cart_page_locators[element_name]
    p element
    get_value=find(:xpath, element).text
      expect(get_value).to eq element_value
    p  "I see #{element_name} element with #{element_value} value on cart page"

  end

  def self.check_item_locator_value(locator_name, value)
    item_locator=vn_get_cart_page_item_1_locators[locator_name]
    get_value = find(:xpath, m_ta(CART_PAGE_PREFIX + locator_name, item_locator)).text
    expect(get_value).to eq value
  end

  def self.expect_cart_page_content(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check == "cart_page_content"
      if page.has_no_xpath?("//div[@class='itemContainer mw-pl-item']")
        locators_array = vn_get_empty_cart_page_locators
        locators_array.each do |(item_name, item_locator)|
          page.assert_selector(:xpath, m_ta(CART_PAGE_PREFIX + item_name, item_locator))
          p  "I see #{item_name} element on cart page"
          end
      else
     locators_array = vn_get_cart_page_locators
     locators_array.each do |(item_name, item_locator)|
       page.assert_selector(:xpath, m_ta(CART_PAGE_PREFIX + item_name, item_locator))
       p  "I see #{item_name} element on cart page"
     end
     end
    elsif content_name_to_check.include? "_hash"
      item_index = content_name_to_check.gsub("_hash","")
      item_in_hash = $vn_test_items_list[item_index]
      item_on_cart = VN_CartPage.get_first_product_parameneters_on_cart_page
      expect(item_on_cart['product_sku']).to include item_in_hash['product_sku']
      expect(item_in_hash['product_size_id']).to include item_on_cart['product_size_id']
      expect(item_on_cart['product_name']).to include item_in_hash['product_name']
      expect(item_in_hash['product_qty']).to include item_on_cart['product_qty']
      p  "I see #{item_index} item with expected parameters on cart page"
    elsif content_name_to_check.include? 'size'
      item_size = find(:xpath, "//div[@class='checkout_itemsize']//span[contains(@id, 'Size')]").text
      expect($vn_item_size).to eql(item_size)
      p "Sizes are equal"
    end
  end


  def self.get_first_product_parameneters_on_cart_page
    item_parameters_on_cart = Hash.new
    locators = vn_get_cart_page_item_1_locators
    item_parameters_on_cart['product_sku'] = find(:xpath,
                                                  m_ta(CART_PAGE_PREFIX + "product_sku", locators['item_1_sku'])).text
    item_parameters_on_cart['product_size_id']= find(:xpath, locators['item_1_size']).text
    item_parameters_on_cart['product_name'] = find(:xpath,
                                                   m_ta(CART_PAGE_PREFIX + "product_name", locators['item_1_name'])).text
    item_parameters_on_cart['product_color'] = find(:xpath,
                                                    m_ta(CART_PAGE_PREFIX + "product_color", locators['item_1_color'])).text
    item_parameters_on_cart['product_qty'] = find(:xpath, locators['item_1_qty']).text
    return item_parameters_on_cart
  end


  def self.click_cart_page_content(element_name_to_click)
    cart_elements = vn_get_cart_page_locators
    element_locator = cart_elements[element_name_to_click]
    find(:xpath, m_ta(CART_PAGE_PREFIX + element_name_to_click, element_locator)).click
    p  "I've clicked #{element_name_to_click}"
  end

  def self.set_item_qty_with_value(element_name, element_value)
    product_number = element_name.gsub("_item_qty", "").to_i
    qty_selector_locator = "(//div[contains(@class, 'itemQTY')]//select)[#{product_number}]"
    ta_qty_locator_name = CART_PAGE_PREFIX + "qty_selector_item" + "#{product_number}"
    find(:xpath, m_ta(ta_qty_locator_name, qty_selector_locator)).click
    sleep 1
    find(:xpath, m_ta(ta_qty_locator_name + ":qty_option" + "#{element_value}",
                    qty_selector_locator + "//option[#{element_value}]")).click
    sleep 2
    get_qty = find(:xpath, m_ta(ta_qty_locator_name + ":qty_option_selected",
                              qty_selector_locator + "//option[@selected='selected']")).text
    sleep 1
    expect(element_value.to_s).to eq(get_qty.to_s)
  end

  def self.clear_cart_page
    if page.has_no_xpath?("//div[@class='itemContainer mw-pl-item']")
      p   "No items to clear in cart"
    else
      loop do
        find(:xpath, "//input[@id='ctl00_Body1_rptCart_ctl00_btnRemove']").click
        sleep 3
        break if page.has_no_xpath?("//div[@class='itemContainer mw-pl-item']")
      end
      p   "I've cleared cart list"
    end
  end


  def self.check_order_total
    merchandise_sub_total = find(:xpath, m_ta(CART_PAGE_PREFIX + "merchandise_sub_total", "//div[@id='tdSubTotal']/span")).text
    merchandise_sub_total = merchandise_sub_total.gsub("$", "").to_f
    estimated_shipping = find(:xpath, m_ta(CART_PAGE_PREFIX + "estimated_shipping", "//div[@id='tdShipping']/span")).text
    estimated_shipping = estimated_shipping.gsub("$", "").to_f
    actual_order_total = find(:xpath, m_ta(CART_PAGE_PREFIX + "actual_order_total", "//span[@id='ctl00_Body1_lblTotal']")).text
    actual_order_total = actual_order_total.gsub("$", "").to_f
    expected_order_total = merchandise_sub_total + estimated_shipping
    expect(actual_order_total).to be == expected_order_total
  end

  def self.fill_offer_code_field_with_offer_code
    page.assert_selector(:xpath, m_ta(CART_PAGE_PREFIX + "offer_code_input",
                                    "//div[@class='mw-applied-offer-info']/following-sibling::input"))
    offer_code = find(:xpath, m_ta(CART_PAGE_PREFIX + "offer_code",
                                 "(//div[@class='promadInner']/b[@class='ytxt'])[2]")).text
    find(:xpath, m_ta(CART_PAGE_PREFIX + "offer_code_input",
                    "//div[@class='mw-applied-offer-info']/following-sibling::input")).set offer_code
  p  "I entered #{offer_code} offer code"
  end

  def self.check_applied_offer_code
    VN_AllPage.scroll_to_bottom
    page.assert_selector(:xpath, m_ta(CART_PAGE_PREFIX + "offer_code_promo",
                                    "//span[@id='ctl00_Body1_lblAppliedPromo']"))
    page.assert_selector(:xpath, m_ta(CART_PAGE_PREFIX + "offer_code_label",
                                    "//label[text()='Offer code successfully updated.']"))
  p  "I see applied offer code"
  end

end