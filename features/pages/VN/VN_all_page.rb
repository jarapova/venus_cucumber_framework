# In this module we collecting methods for all page of VN
require 'capybara/cucumber'


module VN_AllPage
  extend Capybara::DSL
  extend RSpec::Matchers

  def self.isVenus?
    PWA == 'venus'
  end

  def self.wait(duration)
    duration = duration.to_i
    sleep duration
  end

  def self.close_hamburger_banner
    p "Trying to close hamburger banner"
    if page.has_selector?(:xpath, "//div[@class='eg-promo']//a")
      find(:xpath, "(//div[@class='eg-promo']//a)").click
      sleep 1
      find(:xpath, "(//div[@class='eg-promo']//a)").click
      p "I have closed banners"
    end
    sleep 5
  end

  def self.go_back
    page.go_back
  end

  def self.scroll_to_bottom
    (0..10).each do |i|
      sleep 0.3
      page.execute_script("window.scrollTo(0,document.body.scrollHeight*#{i.to_f/10});")
    end
    p "Scrolled to bottom"
  end

  def self.update_page
    VN_AllPage.scroll_to_bottom
    page.execute_script("window.scrollTo(0,0);")
    sleep 1.5
    p "Page updated"
  end

  def self.scroll_to_element(xpath)
    begin
      page.execute_script(%{document.evaluate("#{xpath}",
        document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView();})
      sleep 0.5
    rescue Exception
      p "Couldn't evaluate script"
      sleep 1
    end
  end

  def self.scroll_to_top
    sleep 1
    page.execute_script("window.scrollTo(0,0);")
    sleep 2
    p "I scrolled to top"
  end
end