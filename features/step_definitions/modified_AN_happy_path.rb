
Given(/^user is entered on home_page$/) do
  M_AN_home_page.visit_home_page
end

When(/^user click hamburger_menu_icon on page header$/) do
  M_AN_home_page.hamburger_icon_click
end

And(/^user can see all appropriate content on hamburger_menu$/) do
  M_AN_home_page.all_expected_content_in_hamburger_menu
end

And(/^user click on hamburger category "([^"]*)"$/) do |category|

end