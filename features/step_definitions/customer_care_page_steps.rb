Then(/^user can see "([^"]*)" on customer_care_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_CustomerCarePage.expect_content_on_customer_care_page(content_name_to_check)
  end
end