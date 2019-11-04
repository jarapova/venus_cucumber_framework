Then(/^user can see "([^"]*)" on contact_us_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_ContactUsPage.expect_content_on_contact_us_page(content_name_to_check)
  end
end