@create_organization
Feature: Create organization
  In order to update clients database
  As a MR user
  I want to create an organization

  Scenario: Create pharmacy organization
    Given I navigate to Organizations screen
    When I start creating organization
    And I select pharmacy organization type
    And I am on CreatePharmacy screen
    And I create organization with following info:
      | Name            | SubType | PharmacyType   |
      | Тестовая аптека | Аптека  | Индивидуальная |

  Scenario: Create pharmacy organization 2
    Given I navigate to Organizations screen
    When I create "Организация. Аптека" organization with following info:
      | Name            | SubType | PharmacyType   |
      | Тестовая аптека | Аптека  | Индивидуальная |
    Then it should be displayed in organizations list
