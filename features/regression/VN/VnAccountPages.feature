Feature: This test suite declines Account page functionality for Venus
#work

  #  Log in
  @test
  Scenario: As user I can login to account using my credentials
#    Given user is on home_page
    When user make login as "user1"

  #  Log out
  @test
  Scenario: As logged in User I want to click "Log out" in account icon popup and be logged out
    Given user make login as "user1"
    Then user click "logout_button" on account_information_page
    Then user can see "sign_in_page_content" on sign_in_page

    #Navigation between accounts tab
  @test
  Scenario: User able to switch between accounts tab
    Given user make login as "user1"
    And user can see "welcome_back_account_page_content" on account_information_page
    Then user click "order_history" on account_navigation_tab
    And user can see "order_history_page_content" on order_history_page
    Then user click "wish_list" on account_navigation_tab
    And user can see "wish_list_page_content" on wish_list_page
    Then user click "mail_options" on account_navigation_tab
    Then user can see "mail_options_page_content" on mail_options_page
    And user click "account_info" on account_navigation_tab
    And user can see "account_information_page_content" on account_information_page


 # Add item to wishlist
  @test
  Scenario: As user I want to add item to wishlist
    Given user make login as "user1"
    Then user click "account_info" on account_navigation_tab
    And user can see "account_information_page_content" on account_information_page
    Then user click "wish_list" on account_navigation_tab
    And user can see "wish_list_page_content" on wish_list_page
    And user clear wish_list_page
    Given user is on "item_1" product_page
    And user can see "product_page_content" on product_page
    When user click "available_size_button" on product_page
    Then user set "product_qty" with value "2" on product_page
    And user remember "test_item_1" product parameters on product_page
    Then user click "add_to_wish_list" on product_page
    And user can see "test_item_1_hash" on wish_list_page

 #Account tabs in account modal has errors with TA
  @test
  Scenario: As Logged in user I can select account icon in header and can navigate to each option from popup
    Given user make login as "user1"
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "order_history" on account_modal on header
    And user can see "order_history_page_content" on order_history_page
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "mail_options" on account_modal on header
    And user can see "mail_options_page_content" on mail_options_page
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "wish_list" on account_modal on header
    And user can see "wish_list_page_content" on wish_list_page
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "account_info" on account_modal on header
    And user can see "account_information_page_content" on account_information_page
    And user is on home_page
    Then user click my_account_icon on header
    And user can see "header_account_modal_content" on header
    Then user click "log_out" on account_modal on header
    Then user can see "sign_in_page_content" on sign_in_page



     #Forgot password
  @test
  Scenario: As user I want to use forgot password function
    Given user is on home_page
    When user click my_account_icon on header
    Then user can see "sign_in_page_content" on sign_in_page
    Then user click "forgot_password_link" on sign_in_page
    And user can see "password_lookup_content" on sign_in_page
    And user click cancel_button on password_lookup_modal
    And user can see "sign_in_page_content" on sign_in_page

  Scenario: tralala
    Given user is on home_page