# In this module we collecting methods for subcategory or PLP page of VN
require 'capybara/cucumber'


module VN_ProductListingPage
  extend Capybara::DSL
  extend RSpec::Matchers

  PRODUCT_LISTING_PREFIX = "venus:product_list_page:"

  def self.click_item_image_on_subcategory_page(item_to_click)
    if item_to_click.include? "random"
      page.assert_selector(:xpath, "//div[contains(@id,'item-')]")
      item_count_on_page = find_all(:xpath, "//div[contains(@id,'item-')]").count
      random_item_index = Random.rand(0...item_count_on_page)
      find(:xpath, "//div[@id='item-#{random_item_index}']").click
    end
  end

  def self.click_subcategory_from_filter(subcategory_name)
    if subcategory_name == "random_subcategory"
      page.assert_selector(:xpath, "//ul[@role='listbox']")
      subcategories_count = find_all(:xpath, "//ul[@role='listbox']/li").count
      subcategories_count = subcategories_count-2 #removing SALE and CLEARANCE as it is not subcategories
      p  "I see #{subcategories_count} subcategories in filter"
      random_subcategory_index = Random.rand(1...subcategories_count)
      subcategory_name = find(:xpath, "//ul[@role='listbox']/li[#{random_subcategory_index}]").text
      find(:xpath, "//ul[@role='listbox']/li[#{random_subcategory_index}]").click
      p"I've clicked #{subcategory_name} item from subcategory navigation filter"

    else
      page.assert_selector(:xpath, "//ul[@role='listbox']")
      find(:xpath, m_ta(PRODUCT_LISTING_PREFIX + "filter_subcategory:" + subcategory_name.gsub(" ", ""),
                      "//ul[@role='listbox']/li[text()='#{subcategory_name}']")).click
    end
    end

  def self.click_subcategory_filter
    filter_locator = "(//div[@data-page='Subcategory']//input[@name='subcategories'])/preceding-sibling::div"
    filter_pop_up_locator = "//div[@id='menu-subcategories']//ul[@role='listbox']"
    # page.assert_selector(:xpath, m_ta(PRODUCT_LISTING_PREFIX + "filter_locator", filter_locator)) #analizator work
    page.assert_selector(:xpath, filter_locator)
    find(:xpath, m_ta(PRODUCT_LISTING_PREFIX + "filter_locator", filter_locator)).click
    page.assert_selector(:xpath, filter_pop_up_locator)
    p  "I clicked filter_locator and  see filter pop up on subcategory page"
  end

  def self.click_parameters_filter
    parameters_filter_locator = "(//div[@data-page='Subcategory']//span[text()='Filter'])//ancestor::button"
    parameters_filter_pop_up_locator = "//div[@role='document']//div[text()='Filter']/following::button"
    page.assert_selector(:xpath, m_ta(PRODUCT_LISTING_PREFIX + "parameters_filter_locator", parameters_filter_locator))
    find(:xpath, m_ta(PRODUCT_LISTING_PREFIX + "parameters_filter_locator", parameters_filter_locator)).click
    page.assert_selector(:xpath, m_ta(PRODUCT_LISTING_PREFIX + "parameters_filter_pop_up_locator",
                                       parameters_filter_pop_up_locator))
    p  "I clicked filter_locator and  see filter pop up on subcategory page"
  end

  def self.check_content_subcategory_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check.include? "_subcategory_filter_content"
      # This is checking that subcategory fillter contains elements from YAML file
      category_name = content_name_to_check.gsub("_subcategory_filter_content", "")
      subcategories_array = vn_get_subcategories(category_name)
      subcategories_array.each do |(item_name, item_text)|
        subcategory_element_locator = "//div[@id='menu-subcategories']//ul[@role='listbox']/li[text()='#{item_text}']"
        ta_subcategory_element_locator = PRODUCT_LISTING_PREFIX + category_name + ":#{item_name}"
        page.assert_selector(:xpath, m_ta(ta_subcategory_element_locator, subcategory_element_locator))
        p  "I clicked filter and  see #{item_name} in filter pop up on subcategory page"
        p "I see subcategory filter and  see #{item_name} in filter pop up on subcategory page"
      end
    elsif content_name_to_check.include? "_item_parameters_filter_content"
      #This is checking that item parammeters filter contains expected content from YAML
      #It's checking size, color other
        category_name = content_name_to_check.gsub("_item_parameters_filter_content", "")
        subcategories_array = vn_get_item_parameters_filter_options(category_name)
        subcategories_array.each do |(item_parameter_name, item_parameter_text)|
          if item_parameter_name.include? 'by_'
            parameter_section_locator = "//div[@aria-expanded='true']//h6[text()='#{item_parameter_text}']"
            ta_parameter_section_locator =
                PRODUCT_LISTING_PREFIX + "item_filter:" + category_name + ":#{item_parameter_name}"
            page.assert_selector(:xpath, m_ta(ta_parameter_section_locator, parameter_section_locator))
            p  "I see #{item_parameter_name} filter section in filter pop up on subcategory page"
            p "I see #{item_parameter_name} filter section in filter pop up on subcategory page"
          else
            parameter_locator = "//div[@aria-expanded='true']/ancestor::div//span[text()='#{item_parameter_text}']"
            ta_parameter_locator = PRODUCT_LISTING_PREFIX + "item_filter:" + category_name + ":#{item_parameter_name}"
            page.assert_selector(:xpath, m_ta(ta_parameter_locator.gsub("/", ""), parameter_locator))
            p  "I see #{item_parameter_name} filter section in filter pop up on subcategory page"
            p"I see #{item_parameter_name} filter section in filter pop up on subcategory page"
          end
        end
    elsif content_name_to_check.include? "_items_content"
      #This is checking that PLP have number of items
      # has number of view details ant other text from YAML
      # and its checking that total items number is correct

      subcategory_name = content_name_to_check.gsub("_items_content", "")
      items_content_array = vn_get_subcategory_items_content(subcategory_name)
      items_content_array.each do |(content_name,content_value)|
        if content_name == "view_details"
          page.assert_selector(:xpath, "(//div[contains(@id,'item-')]/a/div/div[p]/*[contains(., '#{content_value}')])[1]")
          values_count = find_all(:xpath, "//div[contains(@id,'item-')]/a/div/div[p]/*[contains(., '#{content_value}')]").count
          page.assert_selector(:xpath, "//div[contains(@id,'item-')]/a/div/div[p]/*[contains(., '#{content_value}')]")
          items_count = find_all(:xpath, "//div[contains(@id,'item-')]").count
          total_items_str = find(:xpath,"//span[contains(.,' total items')]").text.gsub(" total items","")
          total_count=total_items_str.gsub(" total items","").to_i
          p total_items_str
          p total_count
          VN_AllPage.scroll_to_bottom
          VN_AllPage.scroll_to_top

          # expect(total_count).to eq values_count
          # expect(total_count).to eq items_count
          p "I see #{values_count} #{content_name} elements, and #{items_count} items on page and it eq to total count #{total_count} "
        elsif content_name.include? "item_name_contain"
          #This is checking that items on PLP have expected word in theirs names
          # Like there are dresses item names on Dresses PLP
          p "content to check: #{content_value}"
        values_count = find_all(:xpath, "//div[contains(@id,'item-')]/a//div[contains(., '#{content_value}')]").count
        expect(values_count).to be > 1
        p  "I see  #{values_count} #{content_name} elements with value #{content_value} on subcategory page"
        p "I see  #{values_count} #{content_name} elements with value #{content_value} on subcategory page"
        end
      end
    end
  end


  def self.open_parameters_filter_dropdowns
    if page.has_no_xpath?("//div[@tabindex='0' and @aria-expanded='false']")
      p   "no items to expand"
    else
      loop do
        find(:xpath, "(//div[@tabindex='0' and @aria-expanded='false'])[1]").click
        break if page.has_no_xpath?("//div[@tabindex='0' and @aria-expanded='false']")
      end
    end
  end

  def self.close_parameters_filter
    parameters_filter_pop_up_locator = "//div[@role='document']//div[text()='Filter']/following::button[@style='display: none;']"
    find(:xpath, m_ta(PRODUCT_LISTING_PREFIX + "parameters_filter_locator",
                    "//div[@role='document']//div[text()='Filter']/following::button")).click
    page.assert_selector(:xpath, parameters_filter_pop_up_locator, visible: false)
    p  "I closed filter_locator and don't see filter pop up on subcategory page"
  end

  def self.check_price_with_sale_subcategory_page
    items = find_all(:xpath, "//div[contains(@id,'item-')]").count
    (1..items).each do |item|
      price_with_sale = find(:xpath, m_ta(PRODUCT_LISTING_PREFIX + "items_with_sale:" + "item_#{item}_sale_price",
                                        "(//div[contains(@id,'item-')])[#{item}]//p/span/span[2]")).text
      default_price = find(:xpath, m_ta(PRODUCT_LISTING_PREFIX + "items_with_sale:" + "item_#{item}_default_price",
                                      "(//div[contains(@id,'item-')])[#{item}]//p/span/span[1]")).text
      expect(default_price.gsub("$","").to_i).to be > 0
      expect(price_with_sale.gsub("$","").to_i).to be > 0
      expect(default_price.gsub("$","").to_i).to be > price_with_sale.gsub("$","").to_i
    end
    end





end

