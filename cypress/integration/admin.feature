@notImplemented
Feature:  Admin

  Scenario: An Administrator logs in
    Given A User is logged in
    And they have Administrator role
    When they is on the "front" page
    Then They see a "work lists" select button containing options
      | curator |
      | editor  |

  Scenario: An Administrator views the administrative page
    Given An Administrator logs in
    When they click the menu
    And they click the "administrative" menu item
    Then they are routed to the "settings" page
    And they see a "role/access" tab
    And they see a "statistics" tab
    And the "role/access" tab contains a list of Curators containing userIds
    And the "role/access" tab contains a list of Editors containing userIds
    And the "role/access" tab contains a list of Administrators containing userIds
    And they see a form for looking up roles containing a "userId" field and a "retrieve" button

  Scenario: An Administrator looks up a User
    Given An Administrator views the administrative page
    When they fill out a UserId in the "userId" field
    And they click the "retrieve" button
    Then they see a list of the users current roles containing a "remove" button
    And they see a list of the users possible roles containing a "add" button

  Scenario: An Administrator adds a Role to a User
    Given An Administrator looks up a User
    When they click the "add" button on a Role
    Then the Role is moved to "current roles" list
		#todo: add tests to actually check if they got roles ? ( must log in seperate user  | alternative - change users own roles )

  Scenario: An Administrator removes a Role from a User
    Given An Administrator looks up a User
    When they click the "remove" button on a Role
    Then the Role is moved to "possible roles" list

  Scenario: An Administrator views statistics
    Given An Administrator views the administrative page
    When they click on the "statistics" tab
    Then they see the content containing
      | Storage used                  |
      | Number of published resources |
      | Access list                   |
      | Registrator list              |
      | Resource types list           |
      | Licenses list                 |
