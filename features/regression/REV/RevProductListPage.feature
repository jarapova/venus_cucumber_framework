Feature: This test suite declines Product list Page functionality for Revolve

  Items on PLP should have expected content ============================================================= Ready for dev
  Switch between subcategories using subcategory navigation filter ====================================== Ready for dev
  Sorting products ====================================================================================== Ready for dev
  Filtering products ==================================================================================== Ready for dev
  Add multiply items to favorites list ================================================================== Ready for dev
  Navigating from bottom to top of PLP using arrow button =============================================== Ready for dev
  Change item color on PLP ============================================================================== Ready for dev
  Navigation to random PDP from PLP ===================================================================== Ready for dev

  #Items on PLP should have expected content
  Scenario: As user I want see names, prices and images for items on PLP
  Given user is on product_list_page
  When user can see product_list_page_content on product_list_page
#
#  #Switch between subcategories using subcategory navigation filter
#  Scenario: As user I want switch between subcategories using subcategory navigation filter
#  Given user is on product_list_page
#  When user click subcategory_filter on clothing_plp_link page
#  And user select "random_subcategory" from subcategory_filter on product_list_page
#  Then user is on product_list_page

  #Sorting products
  Scenario: As user I want sort products using sort functionality
  Given user is on product_list_page
  When user can see product_list_page_content on product_list_page
  Then user click sort_button on product_list_page
  And user select "high_to_low_sort_category" from sort_dropdown on product_list_page
  And user click close_dropdown_button on sort_dropdown
  And user can see high_to_low_content on product_list_page
  Then user click sort_button on product_list_page
  And user select "low_to_high_sort_category" from sort_dropdown on product_list_page
  And user click close_dropdown_button on sort_dropdown
  And user can see low_to_high_content on product_list_page
#  Then user open filter
#  And user clears filter selection
#  And user can see all items in subcategory
#  And current items count is expected without filter applied

#  Scenario: As user I want sort products using sort functionality
#    Given user visit "clothing_plp_link" page
#    When user can see all items in subcategory
#    Then user open filter
#    And user open random filter option accordion
#    And user select random filter option from accordion
#    And user press Done button on filter pop up
#    And user can see items list with applied filter
#    And current items count become less or equal with filter applied
#    Then user open filter
#    And user clears filter selection
#    And user can see all items in subcategory
#    And current items count is expected without filter applied

  #Filtering products
  Scenario: As user I want filter products using filter functionality
  Given user is on product_list_page
  When user can see product_list_page_content on product_list_page
  And user can see current_items_count on product_list_page
  Then user click filter_button on product_list_page
  And user click "designer_filter" on filter_dropdown
  And user select "designer_filter_option" on designer_filter_accordion
  And user click view_results_button on filter_dropdown
  Then user can see current_items_count become less or equal on product_list_page
#  And user select "Low to High" option
#  And user can see that cheapest item is first item in list
#  Then user open sort dropdown
#  And user select "High to Low" option
#  And user see that most expensive item is first item in list

  #Add multiply items to favorites list
#  Scenario: As user I want add multiply items to favorites list
#    Given user is on home_page
#    When user is logged in as "user1"
#    And user click on favorite icon in header
#    And user is on "favorite items" page
#    And user clear favorite items list
#    And there are no items in favorite list
#    Then user visit "clothing_plp_link" page
#    Then user click on add to favorite icon on two multiply items
#    And user click on favorite icon in header
#    And user is on "favorite items" page
#    Then user can see added product in favorite list
#    Then user click on favorite item icon on two added items
#    And there are no items in favorite list
#
#  #Navigating from bottom to top of PLP using arrow button
#  Scenario: As user I want navigate from bottom to top of PLP using arrow button
#    Given user visit "clothing_plp_link" page
#    When  user scrolls to the bottom of PLP
#    And press on go to top arrow button
#    And user is on top of PLP
#
#  #Change item color on PLP
#  Scenario: As user I want change item color on PLP
#    Given user visit "clothing_plp_link" page
#    When user can see random item with colors option
#    And user press on random item color on PLP
#    Then item color was changed on PLP
#
#
#  #Navigation to random PDP from PLP
#  Scenario: As user I want navigate to random PDP page from PLP
#    Given user visit "clothing_plp_link" page
#    When user click "random_item_image" on category_page
#    And user is on pdp_page