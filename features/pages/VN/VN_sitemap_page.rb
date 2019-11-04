# In this module we collecting methods for Sitemap page of VN
require 'capybara/cucumber'




module VN_SitemapPage
  extend Capybara::DSL
  extend RSpec::Matchers

  SITEMAP_PREFIX = "venus:sitemap_page:"

  def  self.expect_content_on_sitemap_page(content_name_to_check)
    VN_AllPage.update_page
    VN_AllPage.update_page
    if content_name_to_check == 'sitemap_page_content'
      locators_to_check_on_page = vn_get_sitemap_page_locators
      locators_to_check_on_page.each do |(name, locator)|
        page.assert_selector(:xpath, m_ta(SITEMAP_PREFIX + name, locator))
        p  "I see #{name} element on contact us page"
      end
    end
  end
end