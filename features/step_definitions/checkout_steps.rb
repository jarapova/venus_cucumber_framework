And(/^user aggree with shipping address popup$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  else
    page.assert_selector(:xpath, "//div[@class='AddrssOffPick mw-popup']")
    find(:xpath, "//div[@class='AddrssOffPick mw-popup']//input[@value='Continue']").click
    page.assert_selector(:xpath, "//div[@class='mw-payment-methods']//div[text()='Credit card']")
    p  "I've clicked Continue button on shipping address popup"
  end
end

And(/^user clicks on checkout button on cart page$/) do
  if AN_AllPage.isAnnie?
    AN_CartPage.click_checkout
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user on checkout page$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see "([^"]*)" on checkout_page$/) do  |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_CheckoutPage.expect_content_checkout_page(content_name_to_check)
  end
end



