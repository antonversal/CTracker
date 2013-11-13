@currency
Feature: Manage currency collects
  In order to manage my currency collection
  I am as a user
  Want to manage the currency I have collected.

  Background: Sign in
    Given I am sign in as a user
    And I am on the currencies page

  Scenario: List Currencies
    Then I should see list of currencies
    And I should see collected stats

  @javascript
  Scenario: Collect currency
    When I record I collected currency
    Then visited state should be changed

  @javascript
  Scenario: Filter currencies
    When I type first tree letters of currency
    Then I should see filtered currencies
    And I should not see other currencies

  @javascript
  Scenario: Bach select
    When I record all currencies as collected
    Then visited state of all countries should be changed to visited

  @javascript
  Scenario: Bach unselect
    Given all currencies are selected
    And I am on the currencies page
    When I record all currencies as not collected
    Then visited state of all countries should be changed to not visited

  @javascript
  Scenario: Bach select after filter
    When I type first tree letters of currency
    And I record all currencies as collected
    Then visited state of filtered countries should be changed to visited
    And visited state of not filtered countries should not be changed