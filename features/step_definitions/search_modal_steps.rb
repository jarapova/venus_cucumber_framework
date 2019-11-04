Given(/^user click search_icon on header$/) do
  if VN_AllPage.isVenus?
    VN_HeaderPage.search_icon_click
  elsif ST_AllPage.isStage?
    ST_SearchModalPage.open_search_modal
  elsif AN_AllPage.isAnnie?
    AN_SearchModalPage.open_search_modal
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user fill search_field with value "([^"]*)" on search_modal$/) do |arg|
  if VN_AllPage.isVenus?
    VN_SearchModalPage.search_modal_type_tearm(arg)
  elsif AN_AllPage.isAnnie?
    AN_SearchModalPage.search_modal_type_term(arg)
  elsif ST_AllPage.isStage?
    ST_SearchModalPage.search_modal_type_tearm(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see suggested_search on search_modal$/) do
  if VN_AllPage.isVenus?
    VN_SearchModalPage.expect_suggested_search
  elsif AN_AllPage.isAnnie?
    AN_SearchModalPage.expect_suggested_search
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click "([^"]*)" suggested_search on search_modal$/) do |arg|
  if VN_AllPage.isVenus?
    VN_SearchModalPage.click_random_suggested_search
  elsif AN_AllPage.isAnnie?
    AN_SearchModalPage.click_random_suggested_search
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user is on search_result_page$/) do
  if VN_AllPage.isVenus?
    VN_SearchModalPage.expect_search_results
  elsif AN_AllPage.isAnnie?
    AN_SearchModalPage.expect_search_results
  elsif ST_AllPage.isStage?
    ST_SearchModalPage.expect_search_results
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click search_button on search_modal$/) do
  if VN_AllPage.isVenus?
    VN_SearchModalPage.click_search_btn
  elsif AN_AllPage.isAnnie?
    AN_SearchModalPage.click_search_btn
  elsif ST_AllPage.isStage?
    ST_SearchModalPage.click_search_btn
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


And(/^user enters an invalid search request$/) do
  if VN_AllPage.isVenus?
    p  "Step not yet written"
  elsif AN_AllPage.isAnnie?
    AN_SearchModalPage.invalid_search_request
  elsif ST_AllPage.isStage?
    p  "Step not yet written"
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user is on the No Results page$/) do
  if AN_AllPage.isAnnie?
    AN_SearchModalPage.expect_user_is_on_no_results_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user see search modal open$/) do
if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see search_modal_content on search_modal$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
  elsif VN_AllPage.isVenus?
    VN_SearchModalPage.expect_search_modal
end
end


Then(/^user can see "([^"]*)" on search_modal$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_SearchModalPage.expect_content_search_modal(content_name_to_check)
  end
end

And(/user close search_modal$/) do
if VN_AllPage.isVenus?
  VN_SearchModalPage.close_search_modal
end
end

And(/search_modal is closed$/) do
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

Then(/^user can see "([^"]*)" on search_results_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_SearchModalPage.expect_search_results_page(content_name_to_check)
  end
end

And(/^user click "([^"]*)" on search_results_page$/) do |item_to_click|
  VN_SearchModalPage.click_item_image_on_search_results_page(item_to_click)
end

And(/user can see items count on search_result_page$/) do
  if VN_AllPage.isVenus?
    VN_SearchModalPage.check_items_count_on_search_results_page
  end
end

Then(/^user select "([^"]*)" from subcategory_filter on search_result_page$/) do |arg|
  if VN_AllPage.isVenus?
    VN_SearchModalPage.select_subcategory_from_filter_on_search_result_page(arg)
  end
end

And(/user can see items count on search_result_page with applied filter$/) do
  if VN_AllPage.isVenus?
    VN_SearchModalPage.check_items_count_with_applied_filter_on_search_results_page
  end
end

And(/current items count become less or equal with filter applied on search_result_page$/) do
  if VN_AllPage.isVenus?
    VN_SearchModalPage.expect_correct_items_count_with_applied_filter_on_search_results_page
  end
end

And(/^user click "([^"]*)" on search_modal$/) do |arg|
  VN_SearchModalPage.random_suggest_click
end