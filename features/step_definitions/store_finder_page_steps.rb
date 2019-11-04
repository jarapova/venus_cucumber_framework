Then(/^user appears on store finder page$/) do
  if VN_AllPage.isVenus?
    p  "Not available for Venus"
  elsif AN_AllPage.isAnnie?
    AN_StoreFinderPage.check_store_finder_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user enter valid "([^"]*)"$/) do |arg|
  if VN_AllPage.isVenus?
    p  "Not available for Venus"
  elsif AN_AllPage.isAnnie?
    AN_StoreFinderPage.sf_search_input(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user chose random store brand$/) do
  if VN_AllPage.isVenus?
    p  "Not available for Venus"
  elsif AN_AllPage.isAnnie?
    AN_StoreFinderPage.random_store_brand
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user press Search button$/) do
  if VN_AllPage.isVenus?
    p  "Not available for Venus"
  elsif AN_AllPage.isAnnie?
    AN_StoreFinderPage.submit_store_search
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user can see searched stores list$/) do
  if VN_AllPage.isVenus?
    p  "Not available for Venus"
  elsif AN_AllPage.isAnnie?
    AN_StoreFinderPage.validate_store_search
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user can see an updated searched stores list$/) do
  if VN_AllPage.isVenus?
    p  "Not available for Venus"
  elsif AN_AllPage.isAnnie?
    AN_StoreFinderPage.updated_store_search
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end
