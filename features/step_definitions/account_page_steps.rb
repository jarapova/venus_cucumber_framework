And(/^user see "([^"]*)" title$/) do |arg|
  if VN_AllPage.isVenus?
    VN_AccountPage.expect_title(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user can add address info to Account Info page using "([^"]*)" personal data$/) do |user_id|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


Then(/^user able to change mailing settings in Mail option account page$/) do
  if VN_AllPage.isVenus?
    VN_AccountPage.change_mail_settings
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


Then(/^user see added "([^"]*)" in wish list$/) do |item1|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user adding "([^"]*)" to bag from wishlist$/) do |item1|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Given(/^user is on wishlist page$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user clicks Move all items to bag$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user on My account page$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  elsif ST_AllPage.isStage?
    ST_AccountPage.expect_my_account_page
  elsif AN_AllPage.isAnnie?
    AN_AccountPage.user_on_my_account_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


And(/^user click forget_password on sign_in_page$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see password_lookup_modal on sign_in_page$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user click cancel on password_lookup_modal$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user click click_here_link on password_lookup_modal$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user enter valid "user1" email$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user click lookup_password on password_lookup_modal$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see that password has been emailed$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user click already have an account$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see first and last name$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see address info$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see phone number$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see birth date$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see sign in details$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see shipping updates options$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see expected info for each order$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user click on random order number$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user is on order detail page$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see expected order info$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user click on random view details$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see expected info for each item in wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user click remove for random item in wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user see message that item was removed$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^there is no removed item in wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user set random qty for random item in wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user see that qty for random item in wishlist was changed$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user click on random item image in wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user is on expected PDP$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user click update on random item in wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^item was updated$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see all items in wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user select private option for wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user search for "user1" wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user see that no wishlists were found$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user select public option for wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see items from user1 wishlist$/) do
  if VN_AllPage.isVenus?
    p  "No method created yet"
  end
end

And(/^user can see "([^"]*)" on account_information_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_AccountPage.expect_content_on_account_information_page(content_name_to_check)
  end
end

And(/^user click "([^"]*)" on account_information_page$/) do |element_name_to_click|
  if VN_AllPage.isVenus?
    VN_AccountPage.click_element_on_account_information_page(element_name_to_click)
  end
end

And(/^user can see "([^"]*)" on order_history_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_AccountPage.expect_content_on_order_history_page(content_name_to_check)
  end
end

And(/^user can see "([^"]*)" on mail_options_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_AccountPage.expect_content_on_mail_options_page(content_name_to_check)
  end
end


When(/^user click "([^"]*)" on account_navigation_tab$/) do |element_name_to_click|
  if VN_AllPage.isVenus?
    VN_AccountPage.click_element_account_navigation_tab(element_name_to_click)
  end
end

And(/^user can see "([^"]*)" on wish_list_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_AccountPage.expect_cart_page_content(content_name_to_check)
  end
end

And(/^user clear wish_list_page/) do
  if VN_AllPage.isVenus?
    VN_AccountPage.clear_wish_list_page
  end
end

And(/^user click "([^"]*)" on wish_list_page$/) do |arg|
  VN_AccountPage.click_move_to_bag_item(arg)
end