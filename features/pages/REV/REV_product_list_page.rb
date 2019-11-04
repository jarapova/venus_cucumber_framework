require 'capybara/cucumber'

class REV_product_list_page
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.visit_product_list_page
    page.visit rev_get_plp_link
    page.assert_selector(:xpath, "//h1[text()='All New Items']")
    p "I am on plp"
  end

  def self.check_product_list_content
    find_all(:xpath, "//div[contains(., 'All New Items')]//ul/li").each do |el|
      el.assert_selector(:xpath, "//img")
      expect(el.find(:xpath, "div/div/a/div/div[2]/p[1]").text).should_not eq ""
      expect(el.find(:xpath, "div/div/a/div/div[2]/p[4]").text).to match(/(\d[\d.]*)/)
    end
  end

  def self.click_filter_button
    find(:xpath, "//h1/following-sibling::div[1]//button[1]").click
  end

  def self.click_sort_button
    find(:xpath, "//h1/following-sibling::div[1]//button[2]").click
  end

  def self.click_sort_category(category_name)
    sleep 2
    find(:xpath, "//div[text()='Sort']/following-sibling::div//span[contains(., '#{category_name}')]").click
    p "clicked " + category_name
  end

  def self.click_close_sort_button
    sleep 5
    find(:xpath, "//div[text()='Sort']/following-sibling::button").click
  end

  def self.check_high_to_low_content
    sleep 5
    prices= []
    find_all(:xpath, "//div[contains(., 'All New Items')]//ul/li").each do |el|
      prices.push(
          el.find(:xpath, "div/div/a/div/div[2]/p[4]").text
              .match(/(\d+([,.]?)[\d]*)/).to_s.sub(',', '').to_f
      )
    end

    current_element = prices[0]

    for i in 0...prices.count
      expect(current_element).to be >= prices[i]
      current_element = prices[i]
    end
  end

  def self.check_low_to_high_content
    sleep 5
    prices= []
    find_all(:xpath, "//div[contains(., 'All New Items')]//ul/li").each do |el|
      prices.push(
          el.find(:xpath, "div/div/a/div/div[2]/p[4]").text
              .match(/(\d+([,.]?)[\d]*)/).to_s.sub(',', '').to_f
      )
    end

    current_element = prices[0]

    for i in 0...prices.count
      expect(current_element).to be <= prices[i]
      current_element = prices[i]
    end
  end

  def self.update_current_items
    $current_items = get_current_items_count
    p $current_items
  end

  def self.get_current_items_count
    find(:xpath,
         "//h1[text()='All New Items']/following-sibling::div//span[contains(text(), 'ITEMS')]")
        .text.match(/\d+/).to_s.to_i
  end

  def self.click_filter_category(filter_category)
    find(:xpath, "//h6[text()='#{filter_category}']").click
  end

  def self.select_designer_category(designer_category)
    find(:xpath, "//span[text() = '#{designer_category}']").click
  end

  def self.click_filter_view_results_button
    find(:xpath, "//span[text()='View Results']").click
    sleep 5
  end

  def self.check_current_items_become_less
    p get_current_items_count
    expect($current_items).to be > get_current_items_count
  end

end
