Feature: Manage countries
  In order to manage my travel itinerary
  I am as a user
  Want to manage the countries I have visited.

  Background: Sign in
    Given I am sign in as a user
    And I am on the countries page

  Scenario: List Countries
    Then I should see list of countries
    And I should see visited stats

  Scenario: Visit country
    When I record I visited country
    Then visited state should be changed
    And chart should change persentage

  @javascript @filter
  Scenario: Filter countries
    When I type first tree letters
    Then I should see filtered country
    And I should not see other countries