Feature: This test suite defines the Search Menu functionality for Revolve


  Search Menu Flow:

  User can open and close Search Menu ==================================== Ready for dev
  Navigate to PDP from search suggestions ================================ Ready for dev

  View New Arrivals page when submitting blank search term =============== Ready for dev
  View No Products Found page when submitting invalid search term ======== Ready for dev

# User can open and close Search Menu
  Scenario: User opens search menu from homepage
    Given user is on home_page
    And user click search_icon on header
    And user see search modal open
    And user close search_modal
    Then user is on home_page

# Navigate to PDP from search suggestions
  Scenario: User navigates to PDP from search suggestions
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Dresses" on search_modal
    And user can see suggested_search on search_modal
    And user click on "random" suggested_search on search_modal
    Then user is on search_result_page
    And user click "random_item_image" on subcategory_page
    Then user is on pdp_page

    # Navigate to PDP from search results
  Scenario: User navigates to PDP from search results
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "Beauty" on search_modal
    And user click on search_button on search_modal
    Then user is on search_result_page
    And user click "random_item_image" on subcategory_page
    Then user is on pdp_page

# View New Arrivals page when submitting blank search term
  Scenario: User sees New Arrivals page if empty search term submitted on search menu
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value " " on search_modal
    And user click on search_button on search_modal
    Then user is on "New Arrivals" page

# View No Products Found page when submitting invalid search term
  Scenario: User sees No Products Found page if invalid search term submitted on search menu
    Given user is on home_page
    And user click search_icon on header
    And user fill search_field with value "%@@#%&&@#%#$*&$^" on search_modal
    And user click on search_button on search_modal
    And user is on "No Products Found" page