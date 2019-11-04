When(/^user can see "([^"]*)" on hamburger_menu$/) do |content_name|
  if VN_AllPage.isVenus?
    VN_HamburgerMenuPage.expect_content_in_hamburger_menu(content_name)
  elsif ST_AllPage.isStage?
    ST_HamburgerMenuPage.expect_content_in_hamburger_menu
  elsif AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.expect_content_in_hamburger_menu
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user able to use Hamburger menu to navigate to appropriate "([^"]*)" subcategory page of category "([^"]*)"$/) do |subcategory_name, category_name|
  if AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.navigate_to_subcategory_from_category_hamburger(subcategory_name, category_name)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user open Shop by category and see all Categories$/) do
  if AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.open_shop_by_category
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user click on Login in the top of hamburger menu$/) do
  if AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.click_on_login_in_the_top_of_hamburger_menu
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


Then(/^user is able to see account tab$/) do
  if AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.expect_account_tab_in_hamburger_menu
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on category "([^"]*)"$/) do |arg|
  if VN_AllPage.isVenus?
    p  "Mthod is not defined yet for VENUS"
  elsif ST_AllPage.isStage?
    ST_HamburgerMenuPage.navigate_to_category(arg)
  elsif AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.navigate_to_category(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on subcategory "([^"]*)"$/) do |arg|
  if VN_AllPage.isVenus?
    p  "Method is not defined yet for VENUS"
  elsif ST_AllPage.isStage?
    ST_HamburgerMenuPage.navigate_to_subcategory(arg)
  elsif AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.navigate_to_subcategory(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user click on My Account in the bottom of hamburger menu$/) do
  if AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.click_on_my_account_in_the_hamburger_menu
  elsif ST_AllPage.isStage?
    ST_HamburgerMenuPage.navigate_to_my_account
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user click on Logout in the top of hamburger menu$/) do
  if AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.click_on_logout_in_the_hamburger_menu
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end
Then(/^user click on Sign Out in the top of hamburger menu$/) do
  if VN_AllPage.isVenus?
    p  "Method is not defined yet for VENUS"
  elsif ST_AllPage.isStage?
    ST_HamburgerMenuPage.click_sign_out
  elsif AN_AllPage.isAnnie?
    p  "Method is not defined yet for ANNIE SELKE"
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user clicks on "([^"]*)" link in the footer of the Hamburger menu$/) do |hamburger_footer|
  if AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.hamburger_footer_link(hamburger_footer)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on accordion "([^"]*)"$/) do |arg|
  if AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.navigate_to_accordion(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on accordion subcategory "([^"]*)"$/) do |arg|
  if AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.navigate_to_accordion_subcategory(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end
And(/^user click on accordion in subcategory "([^"]*)"$/) do |arg|
  if AN_AllPage.isAnnie?
    AN_HamburgerMenuPage.navigate_to_accordion_in_subcategory(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user sees "([^"]*)" subcategory in Hamburger Menu$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


Then(/^user click "([^"]*)" on hamburger_menu$/) do |hamburger_item_name|
  if VN_AllPage.isVenus?
    VN_HamburgerMenuPage.click_hamburger_item(hamburger_item_name)
  end
end