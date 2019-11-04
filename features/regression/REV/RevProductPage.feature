Feature: This test suite declines Product Page functionality for Revolve


  User can see Product name, style and price ============================================================ Ready for dev
  Price with sale ======================================================================================= Ready for dev
  Product images functionality ========================================================================== Ready for dev
  Product Reviews and rate chosen item ================================================================== Ready for dev
  Rate item using Rate this item button on PDP ========================================================== Ready for dev
  Product colors functionality ========================================================================== Ready for dev
  Product sizes functionality =========================================================================== Ready for dev
  Can't find your size ================================================================================== Ready for dev
  Add item to favorites ================================================================================= Ready for dev
  Product descriptions which includes expected categories =============================================== Ready for dev
  Navigate to checkout using buy now functionality ====================================================== Ready for dev
  Add item to cart ====================================================================================== Ready for dev
  Open PDP of item from Similar items section =========================================================== Ready for dev
  Open PDP of item from Recently viewed section ========================================================= Ready for dev
  Open PDP of item from Complete the look section ======================================================= Ready for dev
  Open PDP of item from Recommended for you section ===================================================== Ready for dev
  Afterpay information on PDP =========================================================================== Ready for dev

  #User can see Product name, style and price
  Scenario: As user I want see Product name, style and price
    Given user visit clothing_pdp_link page
    When user can see "product_name" on pdp_page
    And user can see "product_style" on pdp_page
    And user can see "product_price" on pdp_page

  #Price with sale
  Scenario: As user I want see Product price with/without sale
    Given user is on pdp_page of item with sale
    When user can see "price with sale" on pdp_page

  #Product images functionality
  Scenario: As user I want see product images on PDP
    Given user visit clothing_pdp_link page
    When user can see product image
    And user can switch between product images
    Then user click image_zoom_button on product_page
    And user can switch between zoomed product images
    And user can exit from zoomed images mode

   #Product Reviews and rate chosen item
  Scenario: As user I want see product reviews and rate chosen item
    Given user visit clothing_pdp_link page
    When user is logged in as "user1"
    And user can see ratings & reviews block
    And user click on see all reviews button
    Then user can see reviews for chosen item
    And user click on rate this item button
    And user fill review page with valid data
    Then user click submit button
    And user can see pop up that review was added

   #Rate item using Rate this item button on PDP
  Scenario: As user I want rate item using Rate this item button on PDP
    Given user visit clothing_pdp_link page
    When user is logged in as "user1"
    Then user click on rate this item button
    And user fill review page with valid data
    Then user click submit button
    And user can see pop up that review was added

    #Product colors functionality
  Scenario: As user I want see colors on PDP and choose available color
    Given user visit clothing_pdp_link page
    When user can see product colors
    Then user chose random color
    And item color was changed on PDP


    #Product sizes functionality
  Scenario: As user I want see sizes on PDP and choose available size
    Given user visit clothing_pdp_link page
    When user can see product sizes
    Then user chose random available size



    #Can't find your size
  Scenario: As user I want use Can't find your size functionality
    Given user visit clothing_pdp_link page
    And user can see product sizes
    Then user click can't find your size link
    And user on special order inquiry page

    #Add item to favorites
  Scenario: As user I want add product to favorite from PDP
    Given user is on home_page
    When user is logged in as "user1"
    And user click on favorite icon in header
    And user is on "favorite items" page
    And user clear favorite items list
    Then user visit clothing_pdp_link page
    Then user click on add to favorite icon
    And user click on favorite icon in header
    And user is on "favorite items" page
    Then user can see added product in favorite list
    Then user click on favorite item icon on added item
    And there are no items in favorite list

    #Product descriptions which includes expected categories
  Scenario: As user I want see product descriptions which includes expected categories
    Given user visit clothing_pdp_link page
    When user see opened "product details" dropdown
    Then user click "Size & Fit" on PDP
    And user see opened "Size & Fit" dropdown
    Then user click "About sections" on PDP
    And user see opened "About sections" dropdown
    Then user click "Shipping, and Returns" on PDP
    And user see opened "Shipping, and Returns" dropdown


   #Navigate to checkout using buy now functionality
  Scenario: As user I want to buy item using buy now button on PDP
    Given user visit clothing_pdp_link page
    When user selects random item color
    And user click on buy now button
    And user appears in checkout

   #Add item to cart
  Scenario: As user I want to add item to cart
    Given: user is on home_page
    And user click cart_icon on header
    And user is on cart_page
    And user clear items in cart list
    Then user visit clothing_pdp_link page
    When user selects random item size
    And user click add_to_bag_button on product_page
    Then user click view_bag on popup
    And user is on cart_page
    And user can see expected item in cart

  #Open PDP of item from Similar items section
  Scenario: As user I want to open PDP of item from Similar items section
    Given user visit clothing_pdp_link page
    And user see "Similar items" section
    And each item has expected info in "Similar items" section
    Then user click on random item from "Similar items" section
    And user is on pdp_page

  #Open PDP of item from Recently viewed section
  Scenario: As user I want to open PDP of item from Recently viewed section
    Given user is on home_page
    Then user see "Recently viewed" section
    When user navigate to recently_view_test_item_url PDP
    And user is on pdp_page
    Then user visit clothing_pdp_link page
    And user see "Recently viewed" section
    And each item has expected info in "Recently viewed" section
    Then user click on random item from "Recently viewed" section
    And user is on pdp_page

  #Open PDP of item from Complete the look section
  Scenario: As user I want to open PDP of item from Complete the look section
    Given user visit clothing_pdp_link page
    And user see "Complete the look" section
    And each item has expected info in "Complete the look" section
    Then user click on random item from "Complete the look" section
    And user is on pdp_page

  #Open PDP of item from Recommended for you section
  Scenario: As user I want to open PDP of item from Recommended for you section
    Given user visit clothing_pdp_link page
    And user see "Recommended for you" section
    And each item has expected info in "Recommended for you" section
    Then user click on random item from "Recommended for you" section
    And user is on pdp_page

  #Afterpay information on PDP
  Scenario: As user I want see Afterpay information on PDP
    Given user visit clothing_pdp_link page
    And user clicks on afterpay info
    Then user can see afterpay info modal
    And user close afterpay info modal