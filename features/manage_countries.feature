Feature: Manage countries
  In order to manage my travel itinerary
  I am as a user
  Want to manage the countries I have visited.

  Background: Sign in
    Given I am sign in as a user
    And I am on the countries page

  Scenario: List Countries
    Then I should see list of countries

  Scenario: Visit country
    When I record I visited country
    Then visited state should be changed
    And chart should change persentage
