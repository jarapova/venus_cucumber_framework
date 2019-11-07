# In this module we collecting methods for product page of VN
require 'capybara/cucumber'
require 'capybara'


module VN_ProductPage
  extend Capybara::DSL
  extend RSpec::Matchers

  PRODUCT_PAGE_PREFIX = "venus:product_page:"

  def self.go_to_pdp_link(item_id)
    link = vn_get_item_parameters(item_id)['pdp_link']
    visit BASE_URL + link
  end

  def self.remember_test_item(test_item_index)
    new_item = VN_ProductPage.get_product_parameters_pdp_page
    $vn_test_items_list[test_item_index] = new_item
  end

  def self.remember_complete_the_look_test_item(test_item_index)
    new_item = VN_ProductPage.get_complete_the_look_parameters_pdp_page
    $vn_test_items_list[test_item_index] = new_item
  end

  def self.get_complete_the_look_parameters_pdp_page
    xpath = vn_get_product_page['complete_the_look_first_item_locators']
    p xpath
    parameters_array = Hash.new
    parameters_array['product_name'] = find(:xpath, xpath['complete_the_look_product_name']).text
    parameters_array['product_size_id'] = find(:xpath, xpath['complete_the_look_size_selected']).text.gsub("In Stock", "")
    parameters_array['product_sku'] = find(:xpath, xpath['complete_the_look_sku']).text.gsub("Style #", "")
    parameters_array['product_color'] = find(:xpath, xpath['complete_the_look_color_selected']).text
    parameters_array['product_qty'] = find(:xpath, xpath['complete_the_look_qty']).text
    parameters_array
  end


  def self.set_item_qty_with_value(element_name, element_value)
    VN_AllPage.scroll_to_bottom
    VN_AllPage.scroll_to_top
    if element_name == "product_qty"
      qty_locator = vn_get_product_page['item_parameters_locators']['product_qty']
      find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + 'product_qty', qty_locator)).click
      sleep 1
      find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + 'product_qty_value',
                      "//ul[@role='listbox']/li[@data-value='#{element_value}']")).click
      sleep 1
      # get_qty = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + 'product_qty')).text
      get_qty = find(:xpath, qty_locator).text
      sleep 1
      expect(element_value.to_s).to eq(get_qty.to_s)
    end
  end

  def self.check_element_with_value_on_product_page(element_name, element_value)
    VN_AllPage.scroll_to_bottom
    VN_AllPage.scroll_to_top
    element = vn_get_product_page_locator(element_name)
    # get_value = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + element_name, element)).text
    get_value = find(:xpath,  element).text

    if element_name.include? "color"
      get_value = get_value.gsub("Color: ", "")
      expect(get_value).to eq element_value
      p "I see #{element_name} element with #{element_value} value on cart page"
    elsif element_name.include? "_info"
      expect(get_value).to eq element_value
    elsif element_name.include? "recently_viewed_item_name"
      recently_name_on_page = vn_get_product_page_locator('recently_viewed_item_name')
      # recently_name_on_page = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "recently_viewed_item_name", recently_name_on_page)).text #analizator work
      recently_name_on_page = find(:xpath, recently_name_on_page).text
      remembered_item_index = element_value.gsub("_name", "")
      p $vn_test_items_list
      remembered_name = $vn_test_items_list[remembered_item_index]['product_name']
      expect(remembered_name).to eq recently_name_on_page
    end
  end

  def self.click_element_on_product_page(element_name)
    VN_AllPage.scroll_to_bottom
    VN_AllPage.scroll_to_top
    if element_name.include? 'available_size_button'
      click_available_item_size
    elsif element_name.include? 'complete_the_look'
      click_complete_the_look_element(element_name)
    elsif element_name.include? 'random_you_also_like_item'
      all_yal_items_locator = vn_get_product_page['multiple_options_locators']['yal_items']
      yal_items_count = find_all(:xpath, all_yal_items_locator).count
      random_number = Random.rand(1..yal_items_count)
      click_yal_item(random_number)
    else
      element_locator = vn_get_product_page_locator(element_name)
      find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + element_name, element_locator)).click
    end
    VN_ProductPage.wait_until_progress_bar_closed
    p "I've clicked on #{element_name} on product_page"
  end

  def self.click_yal_item(item_number)
    all_yal_items_locator = vn_get_product_page['multiple_options_locators']['yal_items']
    find(:xpath, all_yal_items_locator + "[#{item_number}]").click
    p "I clicked on #{item_number} yal_item"
  end

  def self.click_available_item_size
    all_available_sizes_locator = vn_get_product_page['multiple_options_locators']['available_sizes']
    available_sizes_count = find_all(:xpath, all_available_sizes_locator).count
    size_number_to_click = Random.rand(1..available_sizes_count)
    item_size = find(:xpath, all_available_sizes_locator+"[#{size_number_to_click}]").text
    find(:xpath, all_available_sizes_locator+"[#{size_number_to_click}]").click
    $vn_item_size = item_size
    p "I choosed #{item_size}"
  end


  def self.click_close_zoomed_image_on_pdp
    VN_ProductPage.expect_main_image_zoomed_on_pdp
    find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "close_zoomed_image_button",
                    "//body[contains(@class,'moov-modal')]//*[@width='100' and @height='100']/..")).click
  end

  def self.click_view_bag_add_to_bag_popup
    view_bag_button_locator = vn_get_product_page['modal_buttons_locators']['view_bag_button']
    p "Want to click on view bag button"
    find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + 'view_bag_button', view_bag_button_locator)).click
    p "Clicked view bag"
    page.assert_selector(:xpath, "//div[@class='dttl mw-checkout-title' and starts-with(text(),'SHOPPING BAG')]")
  end

  def self.click_image_zoom_button_on_pdp
    find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "image_zoom_button", "//*[@width='100' and @height='100']/..")).click
    VN_ProductPage.expect_main_image_zoomed_on_pdp
  end

  def self.expect_zoomed_image_closed_on_pdp
    selected_image = "//body[contains(@class,'moov-modal')]//*[@aria-selected='true']//img[@alt='thumbnail']"
    selected_image_count = find_all(:xpath, selected_image).count
    main_image_reference = "//body[contains(@class,'moov-modal')]//div[@aria-hidden='false']//img[@alt='product']"
    main_image_reference_count = find_all(:xpath, main_image_reference).count
    main_image_zoomed = "//body[contains(@class,'moov-modal')]//img[contains(@style,'transform')]"
    main_image_zoomed_count = find_all(:xpath, main_image_zoomed).count
    main_image_reference_count == 0
    main_image_zoomed_count == 0
    selected_image_count == 0
  end

  def self.expect_main_image_zoomed_on_pdp
    selected_image = "//body[contains(@class,'moov-modal')]//*[@aria-selected='true']//img[@alt='thumbnail']"
    selected_image_scr = find(:xpath, selected_image)[:src]
    main_image_reference = "//body[contains(@class,'moov-modal')]//div[@aria-hidden='false']//img[@alt='product']"
    main_image_reference_src = find(:xpath, main_image_reference)[:src]
    main_image_zoomed = "//body[contains(@class,'moov-modal')]//img[contains(@style,'transform')]"
    main_image_zoomed_src = find(:xpath, main_image_zoomed)[:src]
    main_image_reference_src == main_image_zoomed_src
    selected_image_scr.include? main_image_zoomed_src
    return true
  end

  def self.click_all_images_from_gallery
    images_locator = "(//img[@alt='thumbnail']/ancestor::button)"
    image_count = find_all(:xpath, images_locator).count
    p "image_count on pdp: #{image_count}"
    (1..image_count).each do |image_number|
      click_image_from_galary_on_pdp(image_number)
      sleep 0.5
    end
  end

  def self.click_image_from_galary_on_pdp(image_index)
    VN_ProductPage.expect_main_product_image_on_pdp
    find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "image_in_galary#{image_index}",
                    "(//img[@alt='thumbnail']/ancestor::button)[#{image_index}]")).click
    p "I've clicked #{image_index} from image galary on pdp"
    VN_ProductPage.expect_main_product_image_on_pdp
  end

  def self.expect_main_product_image_on_pdp
    page.assert_selector(:xpath, "//img[@alt='product']/ancestor::div[@aria-hidden='false']")
    main_img_src = find(:xpath, "//div[@aria-hidden='false']/descendant::img[@alt='product']")[:src]
    p "I see main image with #{main_img_src} src"
    selected_galary_image_src = find(:xpath, "//button[@aria-selected='true']/descendant::img[@alt='thumbnail']")[:src]
    p "I see selected image in galary with #{selected_galary_image_src} src"
    selected_galary_image_src.include? main_img_src
    p "Src of main image equal to selected image from galary src"
  end

  def self.click_add_to_bag
    p "I want to add item to cart"
    p "Item parameters are:"
    VN_ProductPage.get_product_parameters_pdp_page
    add_to_bag_button_locator = vn_get_product_page['base_pdp_locators']['add_to_bag_button']
    # find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "add_to_bag_button", add_to_bag_button_locator)).click
    find(:xpath, add_to_bag_button_locator).click
    p "I've clicked Add to bag"
    cart_items_count_locator = "//div[contains(@id, 'cart')]"
    page.assert_selector(:xpath, cart_items_count_locator)
    p items_in_cart = find(:xpath, cart_items_count_locator).text
    items_in_cart
    p expect(items_in_cart.to_i).to be > 0
    p "Finished clicking add to bag"
  end

  def self.expect_pdp_page
    VN_ProductPage.get_product_parameters_pdp_page
    VN_ProductPage.get_available_product_sizes
    vn_get_product_page['base_pdp_locators'].each do |name, locator|
      # page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + name, locator)) #analizer work
      page.assert_selector(:xpath, locator)
      p "I see #{name} on pdp"
    end
  end

  def self.check_content_product_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check.include? "_page_content"
      VN_ProductPage.expect_pdp_page
    elsif content_name_to_check.include? "_test_item_content"
      item_id = content_name_to_check.gsub("_test_item_content", "")
      check_test_item_content(item_id)
    elsif content_name_to_check == "product_сolors"
      xpath = "//div[@data-page='Product']/div[1]//img[contains(@src,'color')]"
      img = find_all(:xpath, xpath)
      img.each do |item|
        page.assert_selector(:xpath, item.path)
        src = find(:xpath, item.path)[:src]
        p "I see  #{src} item color on PDP page "
        p "I see  #{src} item color on PDP page "
      end
    elsif content_name_to_check == 'available_product_сolors'
      available_collors = VN_ProductPage.get_available_colors_of_product
      p "There are #{available_collors.count} colors for this product"
    elsif content_name_to_check.include? 'complete_the_look'
      check_complete_the_look_page_content(content_name_to_check)
    else
      xpath = vn_get_product_page_locator(content_name_to_check)
      page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + content_name_to_check, xpath))
    end
  end

  def self.check_test_item_content(item_id)
    item = vn_get_item_parameters(item_id)
    item_name = item['item_name']
    item_style = item['item_style']
    item_price = item['item_price']
    item_color = item['item_color']
    page_item_name = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + 'product_name',
                                     vn_get_product_page['item_parameters_locators']['product_name'])).text
    expect(page_item_name).to eql(item_name)
    p "I see  #{item_name} item name on PDP page"

    page_item_style = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + 'product_style',
                                      vn_get_product_page['item_parameters_locators']['product_style'])).text
    page_item_style = page_item_style.sub('Style #', '')
    expect(page_item_style).to eql(item_style)
    p "I see  #{item_style} item style on PDP page"

    page_item_price = find(:xpath, vn_get_product_page['item_parameters_locators']['product_price_and_discount']).text
    expect(page_item_price).to include(item_price)
    p "I see item_price #{item_price} included to #{page_item_style} page item price on PDP"

    page_item_color = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + 'product_color',
                                      vn_get_product_page['item_parameters_locators']['product_color'])).text
    page_item_color = page_item_color.sub("Color: ", "")
    expect(page_item_color).to eql(item_color)
    p "I see  #{item_color} item color on PDP page"
  end

  def self.check_complete_the_look_page_content(content_name)
    p "Checking complete the look locators"
    if content_name.include? 'content'
      vn_get_product_page['complete_the_look_first_item_locators'].each do |name, locator|
        page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + name, locator))
        p "I see #{name}"
      end
    else
      locator_to_check = vn_get_product_page['complete_the_look_first_item_locators'][content_name]
      page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + content_name, locator_to_check))
      p " I see #{content_name}"
    end
  end

  def self.click_complete_the_look_element(element_name)
    if element_name.include? 'size'
      click_complete_the_look_size_button
    else
      locator = vn_get_product_page['complete_the_look_first_item_locators'][element_name]
      find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + element_name, locator)).click
    end
  end

  def self.click_complete_the_look_size_button
    sizes_locator = vn_get_product_page['complete_the_look_first_item_locators']['complete_the_look_available_sizes']
    if find_all(:xpath, sizes_locator).count > 0
      find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "complete_the_look_size_button", sizes_locator + "[1]")).click
    end
  end

  def self.get_available_colors_of_product
    xpath = vn_get_product_page['multiple_options_locators']['available_colors']
    elements_array = find_all(:xpath, xpath)
    returning_array = Array.new
    elements_array.each do |element|
      returning_array << element.path
    end
    return returning_array
  end


  def self.wait_until_progress_bar_closed
    loop do
      progressbar = find_all(:xpath, "//div[@role='progressbar']").count
      sleep 1 if progressbar == 2
      break if [1, 0].include?(progressbar)
    end
  end

  def self.get_product_parameters_pdp_page
    parameters_array = Hash.new
    vn_get_product_page['hidden_item_parameters_locators'].each do |name, locator|
      parameters_array[name] = find(:xpath, locator, visible: false)[:value]
      p "#{name}: #{locator}"
      p "Product #{name} is #{parameters_array[name]}"
    end
    vn_get_product_page['item_parameters_locators'].each do |name, locator|
      p "further locator: #{locator}"
      parameters_array[name] = find(:xpath, locator).text
      p "#{name}: #{locator}"
      p "Product #{name} is #{parameters_array[name]}"
    end
    return parameters_array
  end

  def self.get_item_price
    item_price_locator = vn_get_product_page['item_parameters_locators']['product_price_and_discount']
    item_price = find(:xpath, item_price_locator).text.match(/(\d+([,.]?)[\d]*)/).to_s.to_f
    return item_price
  end

  def self.get_item_discounted_price
    #if there is no discount discounted price will be same as default price
    item_price_locator = vn_get_product_page['item_parameters_locators']['product_price_and_discount']
    item_discounted_price = find(:xpath, item_price_locator).match(/(\d+([,.]?)[\d]*)$/).to_s.to_f
    return item_discounted_price
  end


  def self.get_available_product_sizes
sleep 2
    available_item_sizes_locator = vn_get_product_page['multiple_options_locators']['available_sizes']
    available_item_sizes = find_all(:xpath,  available_item_sizes_locator).count
    # available_item_sizes = find_all(:xpath, m_ta(PRODUCT_PAGE_PREFIX + 'available_sizes', available_item_sizes_locator)).count
    size_name_array = Array.new
    (1..available_item_sizes).each do |i|
      available_item_sizes_names = find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "available_size#{i}",
                                                   available_item_sizes_locator + "[#{i}]")).text
      size_name_array << available_item_sizes_names
    end
    p "There are #{size_name_array} sizes available for current item"
    return size_name_array
  end

  def self.click_breadcrumb(piece_name)
    # page.assert_selector(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "breadcrumbs:" + piece_name.gsub(" ", ""), "//div[@data-page= 'Product']//a[text()='#{piece_name}']"))
    page.assert_selector(:xpath, "//div[@data-page= 'Product']//a[text()='#{piece_name}']")
    find(:xpath, m_ta(PRODUCT_PAGE_PREFIX + "breadcrumbs:" + piece_name.gsub(" ", ""),
                    "//div[@data-page= 'Product']//a[text()='#{piece_name}']")).click
  end

end