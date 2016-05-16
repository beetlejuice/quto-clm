@login
Feature: User should be able to login

  Scenario: First login with MR user
    Given I am on Login screen
    When I login with MR user
    And I allow authorization access
    Then I am on Synchronization screen

  Scenario: Next login with MR user
    Given I am on Login screen
    When I login with MR user
    And I allow authorization access
    Then I am on Synchronization screen