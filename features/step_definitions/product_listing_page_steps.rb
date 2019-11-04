And(/^user click subcategory_filter on subcategory_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductListingPage.click_subcategory_filter
  end
end

And(/^user can see "([^"]*)" on subcategory_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_ProductListingPage.check_content_subcategory_page(content_name_to_check)
  end
end

And(/^user click item_parameters_filter on subcategory_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductListingPage.click_parameters_filter
  end
end

And(/^user expand parameters on item_parameters_filter_popup$/) do
  if VN_AllPage.isVenus?
    VN_ProductListingPage.open_parameters_filter_dropdowns
  end
end

And(/^user click "([^"]*)" from subcategory_filter on subcategory_page$/) do |subcategory_name|
  if VN_AllPage.isVenus?
    VN_CategoryPage.click_subcategory_from_filter(subcategory_name)
  elsif AN_AllPage.isAnnie?
    AN_CategoryPage.select_subcategory_from_filter(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click close_item_parameters_filter on subcategory_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductListingPage.close_parameters_filter
  end
end


And(/^user click "([^"]*)" on subcategory_page$/) do |item_to_click|
  VN_ProductListingPage.click_item_image_on_subcategory_page(item_to_click)
end

And(/^user can see price_with_sale on subcategory_page$/) do
  VN_ProductListingPage.check_price_with_sale_subcategory_page
end

And(/^user can see high_to_low_content on product_list_page$/) do
  REV_product_list_page.check_high_to_low_content
end

And(/^user can see low_to_high_content on product_list_page$/) do
  REV_product_list_page.check_low_to_high_content
end

And(/^user can see current_items_count on product_list_page$/) do
  REV_product_list_page.update_current_items
end

Then(/^user can see current_items_count become less or equal on product_list_page$/) do
  REV_product_list_page.check_current_items_become_less
end

Then(/^user click size_filter_button on subcategory_page$/) do
    VN_CategoryPage.open_size_filter
end

And(/^user select "([^"]*)" from filter_popup on subcategory_page$/) do |arg|
    VN_CategoryPage.select_random_size_filter_option
end

And(/^user click view_results_button on filter_popup$/) do
  VN_CategoryPage.click_view_filter_results
end


And(/^user can see current_items_count become less or equal on subcategory_page$/) do
  VN_CategoryPage.check_items_count_less
end

And(/^user can see current_items_count on subcategory_page$/) do
  VN_CategoryPage.update_items_count
end

And(/^user click clear_filter_button on filter_popup$/) do
  VN_CategoryPage.clear_all_filters
end

And(/^user can see current_items_count become equal on subcategory_page$/) do
  VN_CategoryPage.check_items_count_equal
end

And(/^user can see subcategory_filter_button with value "([^"]*)" on subcategory_page$/) do |expected_value|
  VN_CategoryPage.check_filter_button_value(expected_value)
end