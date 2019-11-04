When(/^user selects “My account” icon in header$/) do

  if ST_AllPage.isStage?
    ST_HeaderPage.select_my_acc_icon
  elsif AN_AllPage.isAnnie?
    AN_HeaderPage.select_my_acc_icon
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^a modal with account options displayed$/) do
  if AN_AllPage.isAnnie?
    AN_HeaderPage.expect_account_modal
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can navigate to "([^"]*)" option from account modal$/) do |arg|
  if AN_AllPage.isAnnie?
    AN_HeaderPage.account_modal_navigate_to(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


Given(/^user click hamburger_menu_icon on header$/) do
  if VN_AllPage.isVenus?
    VN_HeaderPage.hamburger_icon_click
  elsif ST_AllPage.isStage?
    ST_HeaderPage.hamburger_icon_click
  elsif AN_AllPage.isAnnie?
    AN_HeaderPage.hamburger_icon_click
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


When(/^user make Log Out from account icon popup$/) do
  if AN_AllPage.isAnnie?
    AN_HeaderPage.make_logout_from_account_icon
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user clicks search icon in header$/) do
  if VN_AllPage.isVenus?
    VN_HeaderPage.search_icon_click
  elsif AN_AllPage.isAnnie?
    AN_HeaderPage.search_icon_click
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click cart_icon on header$/) do
  if VN_AllPage.isVenus?
    VN_HeaderPage.cart_icon_click
  elsif AN_AllPage.isAnnie?
    AN_HeaderPage.cart_icon_click
  elsif ST_AllPage.isStage?
    ST_HeaderPage.cart_icon_click
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user click logo_button on header$/) do
  if VN_AllPage.isVenus?
    VN_HeaderPage.logo_click
  elsif ST_AllPage.isStage?
    ST_HeaderPage.logo_click
  elsif AN_AllPage.isAnnie?
    AN_HeaderPage.logo_click
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user click "([^"]*)" on main_navigation_carousel$/) do |carousel_element_name|
  if VN_AllPage.isVenus?
    VN_HeaderPage.navigate_to_category_from_carousel(carousel_element_name)
  elsif AN_AllPage.isAnnie?
    AN_NavigationPage.navigate_to_category_from_carousel(carousel_element_name)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user clicks random subcategory from Daily New Arrivals category$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
    end
end

Then(/^user click on favorite icon in header$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user can see expected items count on favorite icon$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user can see expected items count on cart icon$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user click my_account_icon on header$/) do
if VN_AllPage.isVenus?
  VN_HeaderPage.my_account_icon_click
  end
end

Then(/^user can see "([^"]*)" on header$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_HeaderPage.expect_header_account_modal(content_name_to_check)
  end
end

Then(/^user click "([^"]*)" on account_modal on header$/) do |element_name_to_click|
  if VN_AllPage.isVenus?
    VN_HeaderPage.click_element_on_header_account_modal(element_name_to_click)
  end
end


When(/^user click "([^"]*)" on header$/) do |element_name|
  if REV_AllPage.isRevolve? or 'fwrd'
    REV_HeaderPage.click_element_on_header(element_name)
  end
end