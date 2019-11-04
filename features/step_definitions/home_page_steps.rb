Given(/^user is on home_page$/) do
  if AN_AllPage.isAnnie?
    p  "AN"
    AN_HomePage.visit_home_page
  elsif ST_AllPage.isStage?
    p  "ST"
    ST_HomePage.visit_home_page
  elsif VN_AllPage.isVenus?
    p  "VN"
    VN_HomePage.visit_home_page
  # page.assert_selector(:xpath, m_ta("test:test", "//*"))
  elsif REV_AllPage.isRevolve?
    REV_CartPage.visit_home_page
  end
end

And(/^user can see main_navigation_carousel on header$/) do
  if VN_AllPage.isVenus?
    VN_HomePage.expect_main_navigation_carousel
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^User able to add "([^"]*)" email to subscription form$/) do |arg|
  if AN_AllPage.isAnnie?
    AN_HomePage.add_email_to_subscription(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user able to see email subscription form$/) do
  if AN_AllPage.isAnnie?
    AN_HomePage.expect_subscription_form
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user able to see more Time Line content on home page by clicking “\+” button$/) do
  if AN_AllPage.isAnnie?
    p  "Skipping: no timeline content to display"
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


Then(/^user able to navigate from homepage to the appropriate page "([^"]*)"$/) do |arg|
  if AN_AllPage.isAnnie?
    AN_HomePage.navigate_to_page(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user able to navigate from homepage to the random content page$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user sees Pixlee container$/) do
  if VN_AllPage.isVenus?
    p  "Pixlee is not available on Venus.com"
  elsif AN_AllPage.isAnnie?
    AN_HomePage.pixlee_check
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user clicks on a random Instagram picture$/) do
  if VN_AllPage.isVenus?
    p  "Pixlee is not available on Venus.com"
  elsif AN_AllPage.isAnnie?
    AN_HomePage.pixlee_click
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user sees Instagram page$/) do
  if VN_AllPage.isVenus?
    p  "Pixlee is not available on Venus.com"
  elsif AN_AllPage.isAnnie?
    AN_HomePage.pixlee_verify
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user scrolls to the "([^"]*)" picture$/) do |arg|
  if VN_AllPage.isVenus?
    p  "Pixlee is not available on Venus.com"
  elsif AN_AllPage.isAnnie?
    AN_HomePage.pixlee_scroll(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user clicks Buy Now$/) do
  if VN_AllPage.isVenus?
    p  "Pixlee is not available on Venus.com"
  elsif AN_AllPage.isAnnie?
    AN_HomePage.pixlee_buy
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user click on View the hot list button$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see Promo_Banner_01_content on home_page$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on Promo_Banner_01$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user is on Promo Banner 01 link page$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user navigate to recently_view_test_item_url PDP$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user see recently_view_test_item_name in "([^"]*)" section$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user can see "([^"]*)" on home_page$/) do |homepage_content_name|
  if VN_AllPage.isVenus?
    VN_HomePage.expect_content_homepage(homepage_content_name)
  elsif REV_AllPage.isRevolve?
    p "Revolve feature is in progress"
  end
end

When(/^click plus_button on home_page$/) do
  if VN_AllPage.isVenus?
    VN_HomePage.click_plus_button
  end
end

Then(/^user can see plus_button on home_page$/) do
  if VN_AllPage.isVenus?
    VN_HomePage.expect_plus_button
  end
end


Then(/^user can see email_subscription_field on home_page$/) do
  if VN_AllPage.isVenus?
    VN_HomePage.expect_email_subscription_field
  end
end

Then(/^user click email_subscription_field on home_page$/) do
  if VN_AllPage.isVenus?
    VN_HomePage.click_email_subscription_field
  end
end

Then(/^user fill email_subscription_field with "([^"]*)" on home_page$/) do |value|
  if VN_AllPage.isVenus?
    VN_HomePage.fill_email_subscription_field(value)
  end
end

Then(/^user click email_subscription_field_arrow_button on home_page$/) do
  if VN_AllPage.isVenus?
    VN_HomePage.email_subscription_field_arrow_button_click
  end
end
