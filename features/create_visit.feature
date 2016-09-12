@for_test @mr
Feature: Create visit
  In order to perform activities
  As a MR user
  I want to be able to create a visit

  Background:
    Given I open Contacts chapter

  Scenario: Create pharmacy visit
    When I select "Все фармацевты" filter
    When I create a visit to any contact
    Then I should see PharmacyVisit screen

#  Scenario: Create medical visit
#    When I select "Все врачи" filter
#    When I create a visit to any contact
#    Then I should see "MedicalVisit" screen