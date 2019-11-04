
And(/^user selects random item color$/) do
  if AN_AllPage.isAnnie?
    AN_ProductPage.select_random_item_color
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user selects random item size$/) do
  if AN_AllPage.isAnnie?
    AN_ProductPage.select_random_item_size
  elsif ST_AllPage.isStage?
    ST_ProductPage.select_random_item_size
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user selects random item band size$/) do
  if AN_AllPage.isAnnie?
    p "No band sizes on AN"
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user selects random item cup size$/) do
  if AN_AllPage.isAnnie?
    p "No cup sizes on AN"
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user select "random_item_qty" on pdp_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductPage.select_random_item_qty
  elsif AN_AllPage.isAnnie?
    AN_ProductPage.select_random_item_qty
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


And(/^user click add_to_bag_button on product_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductPage.click_add_to_bag
  elsif AN_AllPage.isAnnie?
    AN_ProductPage.click_add_to_bag
  elsif ST_AllPage.isStage?
    ST_ProductPage.click_add_to_bag
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Given(/^user is on pdp_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductPage.expect_pdp_page
  elsif AN_AllPage.isAnnie?
    AN_ProductPage.expect_pdp_page
  elsif ST_AllPage.isStage?
    ST_ProductPage.expect_pdp_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

When(/^user adding "([^"]*)" to wish list$/) do |item1|
  if AN_AllPage.isAnnie?
    AN_ProductPage.add_item1_to_wishlist(item1)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


And(/^user selects "([^"]*)" item size$/) do |arg|
  if ST_AllPage.isStage?
    ST_ProductPage.select_item_size(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

When(/^user is able to see "([^"]*)" bar$/) do |arg|
  if AN_AllPage.isAnnie?
    AN_ProductPage.view_pdp_bar(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user clicks on a random product image in "([^"]*)" bar$/) do |arg|
  if AN_AllPage.isAnnie?
    AN_ProductPage.random_select_pdp_bar(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user verifies they are on PDP page$/) do
  if AN_AllPage.isAnnie?
    AN_ProductPage.verify_pdp_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see product image$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end




And(/^user can switch between zoomed product images$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see ratings & reviews block$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on see all reviews button$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see product colors$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user chose random color$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see product sizes$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user chose random available size$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click "([^"]*)" on PDP$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user see opened "([^"]*)" dropdown$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on buy now button$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user appears in checkout$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user see "([^"]*)" section$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^each item has expected info in "([^"]*)" section$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on random item from "([^"]*)" section$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click can't find your size link$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can exit from zoomed images mode$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^item color was changed on PDP$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


And(/^user set "([^"]*)" with value "([^"]*)" on product_page$/) do |element_name, element_value|
  if VN_AllPage.isVenus?
    VN_ProductPage.set_item_qty_with_value(element_name, element_value)
  end
end

And(/^user can see "([^"]*)" on favorite_items_page$/) do |arg|
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/^user click complete_the_look_random_item_add_to_bag button on pdp_page$/) do
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/^"([^"]*)" equal to "([^"]*)" on pdp_page$/) do |arg1, arg2|
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/^user can see complete_the_look on pdp_page$/) do
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/^user can see recently_viewed on pdp_page$/) do
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/^user click recently_viewed on pdp_page$/) do
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/^user can see you'll_also_like on pdp_page$/) do
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end


And(/^user can see "([^"]*)" on product_page$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_ProductPage.check_content_product_page(content_name_to_check)
    end
end

Given(/^user is on "([^"]*)" product_page$/) do |item_id|
  if VN_AllPage.isVenus?
  VN_ProductPage.go_to_pdp_link(item_id)
  end
end

And(/^user click view_bag_button on add_to_bag_popup$/) do
  if VN_AllPage.isVenus?
    VN_ProductPage.click_view_bag_add_to_bag_popup
  end
end


Then(/^user can see main_product_image on product_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductPage.expect_main_product_image_on_pdp
  end
end

When(/^user click "([^"]*)" from item_image_galary on product_page$/) do |image_index|
  if VN_AllPage.isVenus?
    VN_ProductPage.click_all_images_from_gallery
  end
end

Then(/^user can see main_product_image_zoomed on product_page$/) do
  if VN_AllPage.isVenus?
  VN_ProductPage.expect_main_image_zoomed_on_pdp
  end
end

And(/^user click close_zoomed_image on product_page$/) do
  if VN_AllPage.isVenus?
  VN_ProductPage.click_close_zoomed_image_on_pdp
  end
end

And(/^user click image_zoom_button on product_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductPage.click_image_zoom_button_on_pdp
  end
end

And(/^user can see zoomed_image_closed on product_page$/) do
  if VN_AllPage.isVenus?
    VN_ProductPage.expect_zoomed_image_closed_on_pdp
  end
end

Then(/^user click "([^"]*)" on product_page$/) do |element_name|
  if VN_AllPage.isVenus?
    VN_ProductPage.click_element_on_product_page(element_name)
  end
end

Then(/^user can see "([^"]*)" with value "([^"]*)" on product_page$/) do |element_name, element_value|
  if VN_AllPage.isVenus?
    VN_ProductPage.check_element_with_value_on_product_page(element_name, element_value)
  end
end

And(/^user remember "([^"]*)" product parameters on product_page$/) do |test_item|
  if VN_AllPage.isVenus?
    VN_ProductPage.remember_test_item(test_item)
  end
end


And(/^user remember "([^"]*)" complete the look parameters on product_page$/) do |test_item|
  if VN_AllPage.isVenus?
    VN_ProductPage.remember_complete_the_look_test_item(test_item)
  end
end

And(/^user click "([^"]*)" on breadcrumb$/) do |piece_name|
  VN_ProductPage.click_breadcrumb(piece_name)
end