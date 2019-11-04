
Given(/^user make login as "([^"]*)"$/) do |user_id|
  if VN_AllPage.isVenus?
    VN_SignInPage.make_login_as(user_id)
  elsif AN_AllPage.isAnnie?
    AN_SignInPage.make_login_as(user_id)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


When(/^user is logged in as "([^"]*)"$/) do |user_id|
  if ST_AllPage.isStage?
    ST_SignInPage.logged_in_as(user_id)
  elsif AN_AllPage.isAnnie?
    AN_SignInPage.logged_in_as(user_id)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

When(/^user on sign_in_page$/) do
  if AN_AllPage.isAnnie?
    AN_SignInPage.user_on_sign_in_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user on Login page$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  elsif ST_AllPage.isStage?
    ST_SignInPage.expect_login_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

When(/^user can see "([^"]*)" on sign_in_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_SignInPage.expect_content_sign_in_page(content_name_to_check)
  end
end

When(/^user click "([^"]*)" on sign_in_page$/) do |element_name_to_click|
  if VN_AllPage.isVenus?
    VN_SignInPage.click_element_sign_in_page(element_name_to_click)
  end
end


And(/^user click cancel_button on password_lookup_modal$/) do
  VN_SignInPage.click_cancel_forgot_password_modal
end