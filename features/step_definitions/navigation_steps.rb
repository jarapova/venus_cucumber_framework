
Then(/^user is able to navigate to the category page after clicking on "([^"]*)" from the main navigation carousel with listed categories$/) do |category|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  else
    expect(page).to have_selector(:xpath, '//*[@role="tablist"]//div[contains(.,"'+category+'")]')
    p "I see #{category} in the main navigation carousel, and am clicking on the link now"
    find(:xpath, '//*[@role="tablist"]//button[contains(.,"'+category+'")]').click
    find(:xpath, '//h5[contains(.,"'+category+'")]')
    p "I appear to be on the #{category} category page"
  end
end

And(/^user go back$/) do
  if AN_AllPage.isAnnie?
    AN_NavigationPage.go_back_browser
  elsif VN_AllPage.isVenus?
    VN_AllPage.go_back
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user clicks go back from PDP using breadcrumb$/) do
  if AN_AllPage.isAnnie?
    AN_NavigationPage.go_back_breadcrumb_PDP
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user go to url "([^"]*)"$/) do |arg|
  if VN_AllPage.isVenus?
    p  "NO METHODS FOR THIS STEP YET"
  elsif ST_AllPage.isStage?
    ST_NavigationPage.go_to_url(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click "([^"]*)" category$/) do |category|
  if AN_AllPage.isAnnie?
    AN_NavigationPage.go_to_category(category)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click "([^"]*)" subcategory$/) do |category|
  if AN_AllPage.isAnnie?
    AN_NavigationPage.go_to_subcategory(category)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user is on "([^"]*)" catalog page$/) do |arg|
  if AN_AllPage.isAnnie?
    AN_NavigationPage.on_catalog_page(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user clicks on random Press catalog$/) do
  if AN_AllPage.isAnnie?
    AN_NavigationPage.random_press_catalog_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user is on PLP page$/) do
  if AN_AllPage.isAnnie?
    AN_NavigationPage.on_plp_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user checks if they are on a PLP page or collection page$/) do
  if AN_AllPage.isAnnie?
    AN_NavigationPage.plp_collection_check
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user check if they are on a Blog page$/) do
  if AN_AllPage.isAnnie?
    AN_NavigationPage.check_blog_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user press on random catalog$/) do
  if AN_AllPage.isAnnie?
    AN_NavigationPage.press_on_random_catalog
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user press on random collection$/) do
  if AN_AllPage.isAnnie?
    AN_NavigationPage.press_on_random_collection
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


And(/^user is on pdp_page of "([^"]*)"$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end
