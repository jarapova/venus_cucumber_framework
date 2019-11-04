# In this module we collecting methods for HamburgerMenu page of VN
require 'capybara/cucumber'


module VN_HamburgerMenuPage
  extend Capybara::DSL
  extend RSpec::Matchers

  HAMBURGER_MENU_PREFIX = "venus:hamburger_menu:"

  def self.expect_content_in_hamburger_menu(content_name)
    if content_name == "hamburger_first_page_content"
    first_page_elements = vn_get_hamburger_page_elements('first_page_buttons_locators')
    first_page_elements.each do |(element_name,element_locator)|
      page.assert_selector(:xpath, m_ta(HAMBURGER_MENU_PREFIX + element_name, element_locator))
        p  "I see #{element_name} element on first page of hamburger"
      end
    elsif content_name == "hamburger_category_page_content"
    category_page_elements = vn_get_hamburger_page_elements('hamburger_category_page')
    category_page_elements.each do |(element_name, element_text)|
      VN_HamburgerMenuPage.get_category_element(element_name, element_text)
      # locator = '//div[@aria-hidden="true"]//ul[@role="menu"]/li/div[text()="'+"#{element_text}"+'"]'
      # page.assert_selector(:xpath, locator)
      p  "I see element #{element_name} with text #{element_text} on hamburger category page"
        end
    elsif content_name == "hamburger_subcategory_page_content"
      # subcategory_page_elements = vn_get_hamburger_page_elements('hamburger_subcategory_pages')
      # subcategory_page_elements.each do |(element_name, element_text)|
      #   # locator = "//div[@aria-hidden='true']//ul[@role='menu']//div[text()='#{element_text}']"
      #   # page.assert_selector(:xpath, locator)
      #   VN_HamburgerMenuPage.get_subcategory_element(element_text)
      #   p "I see #{element_text} subcategory element on category page of hamburger"
      # end
      subcategory_elements_locator = "((//ul[@role='menu'])[4]//div[not(@amp-bind)]//li//div[text()])"
      subcategories_count= find_all(:xpath, subcategory_elements_locator).count
      categories_locator = "(//ul[@role='menu'])[4]//div[@amp-bind]//li//div[text()]"
      category_count = find_all(:xpath, categories_locator).count
      expect(subcategories_count).to be >= (category_count)
      p "Subcategories count #{subcategories_count}"
      (1..subcategories_count).each do |subcategory_number|
        p subcategory_text = find(:xpath, subcategory_elements_locator + "[#{subcategory_number}]").text
        expect(subcategory_text).not_to eq("")
      end
    elsif content_name == "hamburger_menu_closed"
      locator = "//div[@aria-hidden='true']//ul[contains(.,'Venus Card') and contains(.,'Request A Catalog')]"
      locator_count = find_all(:xpath, locator).count
      expect(locator_count).to eq 0
      p  "I see hamburger menu is closed"
    end
  end

  def self.click_hamburger_item(hamburger_item_name)
    if hamburger_item_name.include? '_on_first_page'
      hamburger_item_name = hamburger_item_name.gsub('_on_first_page','')
      first_page_buttons_locators = vn_get_hamburger_page_elements('first_page_buttons_locators')
      button_locator = first_page_buttons_locators[hamburger_item_name]
      page.assert_selector(:xpath, button_locator)
      # page.assert_selector(:xpath, m_ta(HAMBURGER_MENU_PREFIX + hamburger_item_name, button_locator))//analyzer works
      begin
        # find(:xpath, m_ta(HAMBURGER_MENU_PREFIX + hamburger_item_name, button_locator)).click //analyzer works
        find(:xpath, button_locator).click
      rescue Exception
        VN_AllPage.close_hamburger_banner
      end
      p "I have clicked #{hamburger_item_name}"
    elsif  hamburger_item_name.include? 'category'
      hamburger_item_name = hamburger_item_name.gsub('_category','')
      if hamburger_item_name == 'back'
        begin
          find(:xpath, m_ta(HAMBURGER_MENU_PREFIX + 'back_button',
                          "((//div[@role='document']//ul[@role='menu'])[3]//li)[1]")).click
        rescue Exception
          VN_AllPage.close_hamburger_banner
        end
      else
      VN_HamburgerMenuPage.expect_content_in_hamburger_menu('hamburger_category_page_content')
      category_page_elements = vn_get_hamburger_page_elements('hamburger_category_page')
      element_text = category_page_elements[hamburger_item_name]
      VN_HamburgerMenuPage.get_category_element(hamburger_item_name, element_text).click
        p "I've clicked #{element_text}"
      end
    elsif  hamburger_item_name.include? '_subcat'
      hamburger_item_name = hamburger_item_name.gsub('_subcat','')
      subcategory_page_elements = vn_get_hamburger_page_elements('hamburger_subcategory_pages')
      element_text = subcategory_page_elements[hamburger_item_name]
      VN_HamburgerMenuPage.get_subcategory_element(hamburger_item_name, element_text).click
      p "I've clicked #{element_text} subcategory"
    elsif hamburger_item_name == 'open_app_cats'
      p "Opening categories"
      category_page_elements = vn_get_hamburger_page_elements('hamburger_category_page')
      category_page_elements.each do |(element_name, element_text)|
        VN_HamburgerMenuPage.get_category_element(element_name, element_text).click
        sleep 1
        p "I've clicked and open #{element_text} category"
      end
    end
   sleep 5
  end

  def self.get_category_element(element_name, element_text)
    find(:xpath, m_ta(HAMBURGER_MENU_PREFIX + element_name,
                      # %{(//ul[@role='menu'])[4]//div[@amp-bind]//li//div[text()="#{element_text}"]}))
                      %{(//div[contains(@class, 'menu-item')]/div[text()="#{element_text}"])[1]}))
  end

  def self.get_subcategory_element(element_name, element_text)
    find(:xpath, m_ta(HAMBURGER_MENU_PREFIX + element_name,
                    # "(//ul[@role='menu'])[4]//div[not(@amp-bind)]//li//div[text()='#{element_text}']"))
                      %{(//div[text()="#{element_text}"]}))
  end

end

# And(/^user minimizing "([^"]*)" category Hamburger$/) do |category_name|
#   p  "Minimize #{category_name}"
#   if category_name == "Clothing"
#     find(:xpath,  "(//div[text()='Clothing'])[1]").click
#   elsif category_name == "Sale"
#     find(:xpath, "(//div[text()='Sale'])[5]").click
#   elsif
#   find(m_ta("venus:hamburgerMenu:category#{category_name}")).click
#   end
# end
#
# And(/^user going back to first page of Hamburger$/) do
#
#   p  "I am on category page of Hamburger and see:"
#   p  find(:xpath,  "(//div[text()='Clothing'])[1]").text
#   p  find(:xpath,  "(//div[text()='Swimwear'])[1]").text
#   p  find(:xpath,  "(//div[text()='Lingerie'])[1]").text
#   p  find(:xpath,  "(//div[text()='Plus size'])[1]").text
#   p  find(:xpath,  '(//div[text()="What\'s new"])[1]').text
#   p  find(:xpath,  "(//div[text()='Trends'])[1]").text
#   p  find(:xpath,  "(//div[text()='Pre-order'])[1]").text
#   p  find(:xpath, "(//div[text()='Sale'])[5]").text
#
#   find(:xpath, m_ta("venus:hamburgerMenu:categoriesBackButton", "/html/body/div[3]/div[2]/div/ul[2]/li[1]")).click
#   p  "I've clicked back"
#   page.assert_selector(:xpath, "//div[text()='Shop by Categories']")
#   p  "I am on first page of Hamburger"
# end
