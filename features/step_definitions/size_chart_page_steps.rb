And(/^user can see "([^"]*)" on size_chart_page$/) do |arg|
  if VN_AllPage.isVenus?
    page.assert_selector(:xpath,"//h3[text()='PERFECT FIT CONTEMPORARY SIZING:']")
    p "I am on size chart page"
  end
end