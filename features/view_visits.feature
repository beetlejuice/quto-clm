@view_visits
Feature: View visits

  Scenario: Opening Visits screen
    Given I open Visits chapter
    When I open medical visit
    Then I should see MedicalVisit screen