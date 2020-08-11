Feature: Curator

  Scenario: A logged inn curator has the right role
    Given a Curator is logged in
    When they click the menu
    And they click the "profile" menu item
    Then they are routed to the "profile" page
    And the profile page contains a "roles" table with the text "Curator"