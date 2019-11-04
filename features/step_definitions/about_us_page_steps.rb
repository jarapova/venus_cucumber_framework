Then(/^user can see "([^"]*)" on about_us_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_AboutUsPage.expect_content_on_about_us_page(content_name_to_check)
  end
end