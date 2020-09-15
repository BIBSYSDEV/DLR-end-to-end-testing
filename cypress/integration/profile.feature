Feature: Profile page

  @notImplemented
  Scenario: A user sees the profile page
    Given A User is logged in
    When they click the menu
    And they click the "profile" menu item
    Then they are routed to the "profile" page
    And the profile page contains
      | Id          |
      | Name        |
      | E-mail      |
      | Institution |
      | Apps        |
      | Groups      |
      | Roles       |


  Scenario: A logged inn curator has the right role
    Given a Curator is logged in
    When they click the menu
    And they click the "profile" menu item
    Then they are routed to the "profile" page
    And the profile page contains a "roles" table with the text "Curator"