Feature: This test suite is for checking REV homepage content: Recently viewed, Promo banners, Recommended for you, Hot List

  Promo Banner 01 on homepage  ========================================================================== Ready for dev
  Recently viewed content on homepage =================================================================== Ready for dev
  Navigate to PDP from Recently viewed ================================================================== Ready for dev
  Hot List content on homepage ========================================================================== Ready for dev
  Recommended for you content on homepage =============================================================== Ready for dev

  Scenario: As User I want to see Promo Banner 01 on homepage
    Given: user is on home_page
    Then user can see Promo_Banner_01_content on home_page
    Then user click on Promo_Banner_01
    And user is on Promo Banner 01 link page

  Scenario: As User I want to see Recently viewed content on homepage
    Given: user is on home_page
    Then  user see "Recently viewed" section
    When user navigate to recently_view_test_item_url PDP
    And user is on pdp_page
    And user is on home_page
    Then user see recently_view_test_item_name in "Recently viewed" section

  Scenario: As User I want to navigate to PDP from Recently viewed content from homepage
    Given user is on home_page
    When user see "Recently viewed" section
    And each item has expected info in "Recently viewed" section
    Then user click on random item from "Recently viewed" section
    And user is on pdp_page
  
  Scenario: As User I want to see Hot List content on homepage
    Given: user is on home_page
    When user see "Hot List" section
    And each item has expected info in "Hot List" section
    Then user click on random item from "Hot List" section
    And user is on pdp_page
    And user click logo_button on header
    Then user click on View the hot list button
    And user is on "Hot List" category page

  Scenario: As User I want to see Recommended for you content on homepage
    Given: user is on home_page
    When user see "Recommended for you" section
    And each item has expected info in "Recommended for you" section
    Then user click on random item from "Recommended for you" section
    And user is on pdp_page