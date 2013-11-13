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

  @javascript @visit
  Scenario: Visit country
    When I record I visited country
    Then visited state should be changed

  @javascript @filter
  Scenario: Filter countries
    When I type first tree letters
    Then I should see filtered country
    And I should not see other countries

  @javascript @batch_select
  Scenario: Bach select
    When I record all countries as visited
    Then visited state of all countries should be changed to visited

  @javascript @batch_unselect
  Scenario: Bach unselect
    Given all countries are selected
    And I am on the countries page
    When I record all countries as not visited
    Then visited state of all countries should be changed to not visited

  @javascript @batch_filter_select
  Scenario: Bach select after filter
    When I type first tree letters
    When I record all countries as visited
    Then visited state of filtered countries should be changed to visited
    Then visited state of not filtered countries should not be changed