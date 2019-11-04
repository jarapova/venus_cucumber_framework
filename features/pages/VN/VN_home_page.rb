module VN_HomePage
  extend Capybara::DSL
  extend RSpec::Matchers

  HOME_PREFIX = 'venus:home_page:'

  def self.visit_home_page
    visit BASE_URL
    p  "I am on VN_HomePage  #{BASE_URL} home page"
  end

  def self.expect_content_homepage(homepage_content_name)
    VN_AllPage.scroll_to_bottom
    if homepage_content_name == "all_shop_now_buttons_content"
      expect_shop_now_buttons
    elsif homepage_content_name == 'home_page_content'
      # check text content on homepage
      text_array = vn_get_homepage_content['text_content']
      text_array.each do |item|
        page.assert_selector(:xpath, "//*[text()='#{item[1]}']")
        p  "I see homepage_content_text #{item[1]} on homepage"
      end
      # check shop now buttons content on homepage
      expect_shop_now_buttons
      # check plus_button content on homepage
      expect_plus_button
      # check main banners
      banners_locator = vn_get_homepage_content['locators']['banners']
      banners_count = find_all(:xpath, banners_locator).count
      expect(banners_count).to be > 1
      #check main navigation carousel
      expect_main_navigation_carousel

    elsif homepage_content_name.include? 'shop_now_button'
      buttons_array = vn_get_homepage_content['shop_now_buttons_text'][homepage_content_name]
      button_text = buttons_array['button_text']
      page.assert_selector(:xpath, "//a[@title='Shop Now' and text()='#{button_text}']")
      p  "I see shop_now_button on home_page with Expected text: #{button_text}"
    end
  end

  def self.expect_shop_now_buttons
    p "Expecting all shop now buttons content"
    all_buttons_locator = vn_get_homepage_content['locators']['all_shop_now_buttons']
    all_buttons_count = find_all(:xpath, all_buttons_locator).count
    p "Shop now buttons count is #{all_buttons_count}"
    expect(all_buttons_count).to be > 1
    (1..all_buttons_count).each do |button_number|
      p find(:xpath, all_buttons_locator+"[#{button_number}]").text
    end

  end

  def self.expect_plus_button
    sleep 2
    VN_AllPage.update_page
    VN_AllPage.scroll_to_bottom

    page.assert_selector(:xpath, "(//*[contains(@class, 'fs-timeline-entry')])[1]")
    page.assert_selector(:xpath, "(//*[contains(@class, 'fs-timeline-entry')])[6]")
    page.assert_selector(:xpath, m_ta(HOME_PREFIX + "plus_button", "//*[@class='fs-next-svg']"))
    p  "I see plus_button on home_page with Expected text 6 svg images"
  end

  def self.click_plus_button
    VN_AllPage.scroll_to_bottom

    images_count = find_all(:xpath, "(//*[contains(@class, 'fs-timeline-entry')])").count
    page.assert_selector(:xpath, m_ta(HOME_PREFIX + "plus_button", "//*[@class='fs-next-svg']"))
    p  "I see plus_button on home_page with Expected #{images_count} svg images"
    find(:xpath, m_ta(HOME_PREFIX + "plus_button", "//*[@class='fs-next-svg']")).click
    p  "I click plus_button on home_page"
    VN_AllPage.scroll_to_bottom
    page.assert_selector(:xpath, "(//*[contains(@class, 'fs-timeline-entry')])[#{images_count + 6}]")
    images_count_after_click = find_all(:xpath, "(//*[contains(@class, 'fs-timeline-entry')])").count
    page.execute_script('window.scrollTo(0, 0);')
    expect(images_count_after_click.to_i).to eq images_count.to_i + 6
    p  "I click plus_button on home_page and there are new 6 images aded"
  end

  def self.expect_main_navigation_carousel
    carouselText = find(:xpath, m_ta(HOME_PREFIX + "navigation_carousel", "//*[@role='tablist']")).text
    carousel_elements = carouselText.split("\n")
    carousel_elements.each do |item|
      p  "I see #{item} in main navigation carousel"
    end
    expect(carousel_elements).to eq(VN_CAROUSELELEMENTS)
    p  "I see main navigation carousel in header with Expected #{VN_CAROUSELELEMENTS} items"
  end

def self.expect_email_subscription_field
  VN_AllPage.scroll_to_bottom
  email_field_locator = vn_get_homepage_content['locators']['email_subscription_field']
  page.assert_selector(:xpath, m_ta(HOME_PREFIX + "email_subscription_field", email_field_locator))
  p  "I can see email subscription field on homepage"
end


def self.click_email_subscription_field
  sleep 1
  email_field_locator = vn_get_homepage_content['locators']['email_subscription_field']
  find(:xpath, m_ta(HOME_PREFIX + "email_subscription_field", email_field_locator)).click
  p  "I've clicked email subscription field on homepage"
end


def self.fill_email_subscription_field(value)
  email_field_locator = vn_get_homepage_content['locators']['email_subscription_field']
  find(:xpath, m_ta(HOME_PREFIX + "email_subscription_field", email_field_locator)).set value
  p  "I've filled email subscription field with #{value} on homepage"
end


def self.email_subscription_field_arrow_button_click
  email_field_button_locator = vn_get_homepage_content['locators']['email_subscription_field_arrow_button']
  find(:xpath, m_ta(HOME_PREFIX + "email_subscription_field_arrow_button", email_field_button_locator)).click
  p  "I've clicked arrow button on email subscription field on homepage"
end

end
