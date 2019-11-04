# In this module we collecting methods for category page of VN
require 'capybara/cucumber'


module VN_CategoryPage
  extend Capybara::DSL
  extend RSpec::Matchers

  CATEGORY_PREFIX = "venus:category_page:"

  def self.expect_content_category_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check.include? "_category_dropdown"
      category_name = content_name_to_check.gsub("_category_dropdown","")
      dropdown_text = vn_get_category_dropdown_text(category_name)
      locator = '//input[@name="subcategories"]/preceding-sibling::div[text()="'+dropdown_text+'"]'
      page.assert_selector(:xpath, m_ta(CATEGORY_PREFIX + category_name, locator))
      p  "I see #{content_name_to_check} on category page"
    elsif content_name_to_check.include? "shop_now_buttons"
      # category_name = content_name_to_check.gsub("_shop_now_buttons","")
      # shop_now_buttons_text = vn_get_category_shop_now_buttons(category_name)
      # shop_now_buttons_text.each do |(button_name, button_text)|
      #   locator = "//div[@data-page='Category']//a[@title='Shop Now' and text()='#{button_text}']"
      #   p locator
      #   page.assert_selector(:xpath, locator)
      #   p  "I see #{button_name} with #{button_text} on category page"
      shop_now_buttons_locator = "(//div[@data-page='Category']//a[@title='Shop Now' and text()])"
      shop_now_buttons_count = find_all(:xpath, shop_now_buttons_locator).count
      expect(shop_now_buttons_count).to be >= 1
      p "Shop now buttons"
      (1..shop_now_buttons_count).each do |button_number|
        p find(:xpath, shop_now_buttons_locator+"[#{button_number}]").text
      end
    elsif content_name_to_check.include? "category_banners"
      category_banners_locator = "//div[@data-page='Category']//img[@src]"
      category_banners_count = find_all(:xpath, category_banners_locator).count
      expect(category_banners_count).to be >= 1
      p "I see #{category_banners_count} banners on category page"
    end
  end


  def self.select_random_subcategory_from_filter_on_category_page
    category_name = find(:xpath, "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div").text
    p"I see #{category_name} navigation filter"
    find(:xpath, "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div").click
    p"I've clicked on #{category_name} navigation filter"
    page.assert_selector(:xpath, "//ul[@role='listbox']")
    VN_CategoryPage.click_random_subcategory_from_filter
  end

  def self.click_random_subcategory_from_filter
    page.assert_selector(:xpath, "//ul[@role='listbox']")
    subcategories_count = find_all(:xpath, "//ul[@role='listbox']/li").count
    subcategories_count = subcategories_count-2 #removing SALE and CLEARANCE as it is not subcategories
    p  "I see #{subcategories_count} subcategories in filter"
    random_subcategory_index = Random.rand(1...subcategories_count)
    subcategory_name = find(:xpath, "//ul[@role='listbox']/li[#{random_subcategory_index}]").text
    find(:xpath, "//ul[@role='listbox']/li[#{random_subcategory_index}]").click
    p"I've clicked #{subcategory_name} item from subcategory navigation filter"
  end

  def self.expect_category_page_for(arg)
    page.assert_selector(:xpath, m_ta(CATEGORY_PREFIX + "category_filter",
                                    "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div"))
    filter_text = find(:xpath, m_ta(CATEGORY_PREFIX + "category_filter",
                                  "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div")).text
    expect(arg.upcase).to eq(filter_text)
    p  "I appear on #{filter_text} page"
  end

  def self.click_random_product
    product_count = find(:xpath, "//div[@data-page='Subcategory']//span[contains(., 'total items')]")
                        .text.match(/\d+/).to_s.to_i
    product_number = Random.rand(product_count)
    p "clicked product number #{product_number}"
    # find(:xpath, "//div[@id='item-#{product_number}']").click
    find(:xpath, "(//li/div/div)[2]").click
  end

  def self.select_subcategory_from_filter_on_category_page(arg)
    # page.assert_selector(:xpath, m_ta(CATEGORY_PREFIX + "category_filter","(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div")) //analyzer works
    page.assert_selector(:xpath, "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div")


    # category_name = find(:xpath, m_ta(CATEGORY_PREFIX + "category_filter",
    #                                   "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div")).text //analyzer works
    category_name = find(:xpath,"(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div").text
    category_name = category_name.downcase.capitalize
    p"I see #{category_name} navigation filter"
    # find(:xpath, m_ta(CATEGORY_PREFIX + "category_filter",
    #                 "(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div")).click #analizator work
    find(:xpath,"(//div[@data-page='Category']//input[@name='subcategories'])/preceding-sibling::div").click
    page.assert_selector(:xpath, "//ul[@role='listbox']")
    sleep 1
    find(:xpath, m_ta(CATEGORY_PREFIX + "category_filter:" + arg.gsub(" ", ""),
                    "//ul[@role='listbox']/li[text()='#{arg}']")).click
    # find(:xpath, "//ul[@role='listbox']/li[text()='Dresses']").click
    if category_name.include? "Sale"
      page.assert_selector(:xpath, m_ta(CATEGORY_PREFIX + category_name.gsub(" ", ""),
                                      "//div[@data-page='Subcategory']//h1[contains(text(), 'sale')]"))
    else
      page.assert_selector(:xpath, m_ta(CATEGORY_PREFIX + category_name.gsub(" ", ""),
                                      "//div[@data-page='Subcategory']//h1[text()='#{category_name}']"))
    end
    end

  def self.open_size_filter
    page.assert_selector(:xpath, m_ta(CATEGORY_PREFIX + "size_filter",
                                    "//span[text()='Filter']/ancestor-or-self::button"))
    find(:xpath, m_ta(CATEGORY_PREFIX + "size_filter",
                    "//span[text()='Filter']/ancestor-or-self::button")).click
    p  "I opened the Filter"
  end

  def self.clear_all_filters
    sleep 3
    page.assert_selector(:xpath, m_ta(CATEGORY_PREFIX + "filter_clear_all_button",
                                    "//span[text()='Clear All']/ancestor-or-self::button"))
    page.assert_selector(:xpath, "//input[@type = 'checkbox']/preceding::label")
    find(:xpath, m_ta(CATEGORY_PREFIX + "filter_clear_all_button",
                    "//span[text()='Clear All']/ancestor-or-self::button")).click
    p  "I cleared filter selections"
    sleep 2
  end

  def self.click_subcategory_from_filter(subcategory_name)
    if subcategory_name.include? "random"
      subcategory_count = find_all(:xpath, "//ul[@role='listbox']//li").count
      #Random starts from 2 because li is a main category name
      random_parameter = Random.rand(2..subcategory_count)
      p find(:xpath, "//ul[@role='listbox']//li[#{random_parameter}]").text
      find(:xpath, "//ul[@role='listbox']//li[#{random_parameter}]").click
    elsif find(:xpath, m_ta(CATEGORY_PREFIX + "subcategory_filter:" + subcategory_name,
                          "//ul[@role='listbox']//li[contains(.,'#{subcategory_name}')]")).click
    end
  end
#Labels are used because Capybara could not find input
#Maybe some nodes are staying over it
  def self.select_random_size_filter_option
    count = find_all(:xpath, "(//label)").count
    p count
    random_parameter = Random.rand(1..count)
    find(:xpath, "(//label)[#{random_parameter}]").click
  end

  def self.click_view_filter_results
    page.assert_selector(:xpath, "//button//span[contains(text(),'View Results' )]")
    find(:xpath, m_ta(CATEGORY_PREFIX + "filter_view_results_button",
                    "//button//span[contains(text(),'View Results' )]")).click
    p "I clicked view_results_button"
  end

  def self.update_items_count
    $base_items_count = find(:xpath, m_ta(CATEGORY_PREFIX + "total_items",
                                        "//div[@data-page='Subcategory']//span[contains(., 'total items')]"))
                         .text.match(/\d+/).to_s.to_i
    p "current items count: #{$base_items_count}"
  end

  def self.check_items_count_less
    new_count = find(:xpath, m_ta(CATEGORY_PREFIX + "total_items",
                                "//div[@data-page='Subcategory']//span[contains(., 'total items')]"))
                    .text.match(/\d+/).to_s.to_i
    expect(new_count).to be <= $base_items_count
  end

  def self.check_items_count_equal
    new_count = find(:xpath, m_ta(CATEGORY_PREFIX + "total_items",
                                "//div[@data-page='Subcategory']//span[contains(., 'total items')]"))
                    .text.match(/\d+/).to_s.to_i
    p "#{new_count} and old count: #{$base_items_count}"
    expect(new_count). to eq $base_items_count
  end

  def self.check_filter_button_value(expected_value)
    page.assert_selector(:xpath, m_ta(CATEGORY_PREFIX + 'filter_button',
                                    "//div[@role='button' and text()= '#{expected_value}']"))
  end

 end



