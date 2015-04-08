@javascript
Feature: Filter autofill response by breeder city and state

  As a prospective dog owner
  So that I can quickly breeders in my area
  I want to be able to filter breeders by there city and state

  Background: breeders have been added to the database
    Given the following breeders exist:
      | name            | city     | state  |
      | Carl            | Berkeley | CA     |
      | Chris           | Berkeley | CA     |
      | Alex            | Richmond | CA     |
      | Alexander       | New York | NY     |
      | Michael Jackson | Boston   | MA     |
      | George Michael  | Fresno   | CA     |
      | George W. Bush  | Waco     | TX     |
    And I am on the RateMyPup home page

  Scenario: searching for a breeder with city and state
    When I enter "George", "Berkeley", "CA" into breeder search
    Then I should see "George W. Bush"
    And I should not see "Alex"
    And I should see "Don't see it? Add a new breeder"

  Scenario: search for a breeder without city and state
    When I enter "George", "", "" into breeder search
    Then I should see "George W. Bush" and "George Michael"

  Scenario: search for a breeder with only state
    When I Enter "C", "", "CA" into breeder search
    Then I should see "Carl" and "Chris"