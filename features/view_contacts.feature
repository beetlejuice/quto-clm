@for_test @mr
Feature: View contacts
  In order to review clients
  As a MR user
  I want to be able to view contacts

  Background:
    Given I open Contacts chapter

  Scenario: View contact card
    When I select "Все врачи" filter
    And I open a contact
    Then I should see Contact screen