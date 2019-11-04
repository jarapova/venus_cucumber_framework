And(/^user select random_subcategory from subcategory_filter on category_page$/) do
  if VN_AllPage.isVenus?
    VN_CategoryPage.select_random_subcategory_from_filter_on_category_page
  elsif AN_AllPage.isAnnie?
    AN_CategoryPage.select_random_subcategory_from_category_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user is on "([^"]*)" category page$/) do |arg|
  if VN_AllPage.isVenus?
    VN_CategoryPage.expect_category_page_for(arg)
  elsif AN_AllPage.isAnnie?
    AN_CategoryPage.expect_category_page_for(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user select "([^"]*)" from subcategory_filter on category_page$/) do |subcategory_name|
  if VN_AllPage.isVenus?
    VN_CategoryPage.select_subcategory_from_filter_on_category_page(subcategory_name)
  elsif AN_AllPage.isAnnie?
    AN_CategoryPage.select_subcategory_from_filter(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user is on "([^"]*)" subcategory page$/) do |arg| #This works for subcategories NOT for subcategory-type
  if ST_AllPage.isStage?
    ST_CategoryPage.expect_subcategory_page_for(arg)
  elsif AN_AllPage.isAnnie?
    AN_CategoryPage.expect_subcategory_page_for(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end
#maybe useless
Then(/^user open size filter$/) do
  if AN_AllPage.isAnnie?
    AN_CategoryPage.open_size_filter
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user selects random filter option$/) do
  if AN_AllPage.isAnnie?
    AN_CategoryPage.select_random_size_filter_option
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see items list with applied filter$/) do
  if AN_AllPage.isAnnie?
    AN_CategoryPage.expect_items_list_with_applied_filter
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^current items count become less or equal with filter applied$/) do
  if AN_AllPage.isAnnie?
    AN_CategoryPage.compare_item_count_should_be_less
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user clears filter selection$/) do
  if AN_AllPage.isAnnie?
    AN_CategoryPage.clear_all_filters
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see all items in subcategory$/) do
  if AN_AllPage.isAnnie?
    AN_CategoryPage.expect_items_in_list
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^current items count is expected without filter applied$/) do
  if AN_AllPage.isAnnie?
    AN_CategoryPage.compare_item_count_should_be_more
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user selects two random filter options$/) do
  if AN_AllPage.isAnnie?
    AN_CategoryPage.select_two_random_size_filter
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user press 'View Results' button on filter pop up$/) do
  if AN_AllPage.isAnnie?
    AN_CategoryPage.view_results_click
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on random gallery category$/) do
  if VN_AllPage.isVenus?
    p "Not available for Venus"
  elsif AN_AllPage.isAnnie?
    AN_CategoryPage.random_gallery_category
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on random gallery subcategory$/) do
  if VN_AllPage.isVenus?
    p "Not available for Venus"
  elsif AN_AllPage.isAnnie?
    AN_CategoryPage.random_gallery_subcategory
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user is on category page$/) do
  if AN_AllPage.isAnnie?
    AN_CategoryPage.user_is_on_category_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see product_list_page_content on product_list_page$/) do
  REV_product_list_page.check_product_list_content
end

And(/^user click subcategory_filter on clothing_plp_link page$/) do
  p "REV step definition in progress"
end

And(/^select "random_subcategory"  from subcategory_filter on category_page$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click sort_button on product_list_page$/) do
  REV_product_list_page.click_sort_button
end

And(/^user open random filter option accordion$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user select random filter option from accordion$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user press Done button on filter pop up$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user open sort dropdown$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user select "([^"]*)" option$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see that cheapest item is first item in list$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
  end
end

And(/^user see that most expensive item is first item in list$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
  end
end

And(/^user click on add to favorite icon on two multiply items$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
  end
end

And(/^user click on favorite item icon on two added items$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
  end
end

And(/^user scrolls to the bottom of PLP$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
  end
end

And(/^user is on top of PLP$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
  end
end

And(/^user can see random item with colors option$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
  end
end

And(/^user press on random item color on PLP$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
  end
end

And(/^item color was changed on PLP$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
  end
end

And(/^user can see expected info for each item on PLP$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end



And(/^price with sale displays correctly$/) do
if REV_AllPage.isRevolve?
  p  "REV step definition in progress"
  p "REV step definition in progress"
end
end

And(/^user click "([^"]*)" on category_page$/) do |arg|
  if VN_AllPage.isVenus?
    VN_CategoryPage.click_random_product
  end
end

Then(/^user can see "([^"]*)" on category_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_CategoryPage.expect_content_category_page(content_name_to_check)
  end
end


And(/^user select "([^"]*)" from subcategory_filter on product_list_page$/) do |some_category|

end

And(/^user select "([^"]*)" from sort_dropdown on product_list_page$/) do |category|
  p category
  if category.eql?("high_to_low_sort_category")
    p 'chosen l t h'
    REV_product_list_page.click_sort_category('Price: High to Low')
  elsif category.eql?("low_to_high_sort_category")
    REV_product_list_page.click_sort_category('Price: Low to High')
  end
end

And(/^user click close_dropdown_button on sort_dropdown$/) do
  REV_product_list_page.click_close_sort_button
end

Then(/^user click filter_button on product_list_page$/) do
  REV_product_list_page.click_filter_button
end

And(/^user click "([^"]*)" on filter_dropdown$/) do |filter_category|
  REV_product_list_page.click_filter_category("Designer")
end

And(/^user select "([^"]*)" on designer_filter_accordion$/) do |arg|
  REV_product_list_page.select_designer_category("1. STATE")
end

And(/^user click view_results_button on filter_dropdown$/) do
  REV_product_list_page.click_filter_view_results_button
end