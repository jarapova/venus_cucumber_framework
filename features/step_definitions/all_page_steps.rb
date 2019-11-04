And(/^user is on "([^"]*)" page$/) do |arg|
  if AN_AllPage.isAnnie?
    AN_AllPage.expect_user_is_on_page(arg)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


Given(/^user add item from TESTITEM_URL to cart$/) do |test_item_url_item|
  if AN_AllPage.isAnnie?
    AN_CartPage.add_item_to_cart(test_item_url_item)
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user visit clothing_pdp_link page$/) do |test_clothing_item_url_item|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user is on product_list_page$/) do
  REV_product_list_page.visit_product_list_page
end

And(/^user needs to close email signup popup$/) do
  if VN_AllPage.isVenus?
    p "Not yet written for Venus"
  elsif AN_AllPage.isAnnie?
    AN_NavigationPage.close_email_popup
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user close all banners$/) do
  if ST_AllPage.isStage?
    ST_AllPage.close_all_banners
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^User makes test loop to check cart coockies merging 1$/) do
  if ST_AllPage.isStage?
    (1...2).each {
      arg = "woomen shirts"
      ST_SearchModalPage.open_search_modal
      ST_SearchModalPage.search_modal_type_tearm(arg)
      ST_SearchModalPage.click_search_btn
      ST_SearchModalPage.expect_search_results
      ST_NavigationPage.select_random_item
      ST_AllPage.close_all_banners
      ST_HeaderPage.cart_icon_click
      ST_CheckoutPage.change_item_qty
      ST_ProductPage.get_cart_info_1
      ST_HomePage.visit_home_page
    }
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^User makes test loop to check cart coockies merging 2$/) do
  if ST_AllPage.isStage?
    (1...2).each {
      arg = "woomen shirts"
      ST_SearchModalPage.open_search_modal
      ST_SearchModalPage.search_modal_type_tearm(arg)
      ST_SearchModalPage.click_search_btn
      ST_SearchModalPage.expect_search_results
      ST_NavigationPage.select_random_item
      ST_AllPage.close_all_banners
      ST_HeaderPage.cart_icon_click
      ST_CheckoutPage.change_item_qty
      ST_ProductPage.get_cart_info_2
      ST_HomePage.visit_home_page
    }
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And (/^user is on the Desktop site$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


And(/^user enter valid email$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on arrow button to proceed$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user is on subscribe landing page$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user fill all required fields$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click submit profile button$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user see thanks message$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


And(/^user clear favorite items list$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^there are no items in favorite list$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see added product in favorite list$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end
And(/^user click on favorite item icon on added item$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click view_bag on popup$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see categories dropdown$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on add to favorite icon$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can’t see added product in favorite list$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see reviews for chosen item$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

 And(/^user click on rate this item button$/) do
   if REV_AllPage.isRevolve?
     p  "REV step definition in progress"
     p "REV step definition in progress"
   end
 end

And(/^user fill review page with valid data$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

 And(/^user click submit button$/) do
   if REV_AllPage.isRevolve?
     p  "REV step definition in progress"
     p "REV step definition in progress"
   end
 end

And(/^user can see pop up that review was added$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^press on go to top arrow button$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click continue_shopping button on popup$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user is on pdp_page of item with sale$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user on special order inquiry page$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end


And(/^user is on size_chart_page$/) do
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/^user is on favorite_items_page$/) do
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/^user can see "product_name" on favorite_items_page$/) do |arg|
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end



And(/user can see "([^"]*)" for "([^"]*)" on favorite_items_page$/) do |arg1, arg2|
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/user click "([^"]*)" for "([^"]*)" on favorite_items_page$/) do |arg1, arg2|
  if VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/user wait "([^"]*)" sec$/) do |duration|
  if VN_AllPage.isVenus?
    VN_AllPage.wait(duration)
    end
  end