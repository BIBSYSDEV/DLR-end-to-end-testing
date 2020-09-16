@notImplemented
Feature: Resource access

  Scenario: A Publisher views access to a Resource
    Given A Publisher views their published Resource Item
    When they click the "access" tab
    Then they see a Read access list
    And they see an "add" button for the Read access list
    And they see a Write access list
    And they see an "add" button for the Write access list

  Scenario: A Publisher grants write access to a Resource
    Given A Publisher views access to a Resource
    When They click the "add" button for the Write access list
    And they click on the "user" option on the button
    Then they see a "user" field
    When they enter a valid email or feideId in the "user" field
    And they press the "OK" button
    Then they see the user in the Write access list

  Scenario: A Publisher grants write access to multiple users to a Resource
    Given A Publisher views access to a Resource
    When They click the "add" button for the Write access list
    And they click on the "user" option on the button
    Then they see a "user" field
    When they enter several valid emails or feideIds in the "user" field, separated by semicolon
    And they press the "OK" button
    Then they see the users in the Write access list

  Scenario: A Publisher removes write access to a Resource
    Given A Publisher views access to a Resource
    And there are items in the Write access list
    When They click the "remove" button for an item in the Write access list
    Then they see the user is removed from the  Write access list

  Scenario: A Publisher grants read access to a User for a Resource
    Given A Publisher views access to a Resource
    And the resource is not published
    When They click the "add" button for the Read access list
    And they click on the "user" option on the button
    Then they see a "user" field
    When they enter a valid email or feideId in the "user" field
    And they press the "OK" button
    Then they see the user in the Read access list

  Scenario: A Publisher grants read access to a multiple Users for a Resource
    Given A Publisher views access to a Resource
    And the resource is not published
    When They click the "add" button for the Read access list
    And they click on the "user" option on the button
    Then they see a "user" field
    When they enter several valid emails or feideIds in the "user" field, separated by semicolon
    And they press the "OK" button
    Then they see the users in the Read access list

  Scenario: A Publisher removes read access to a Resource
    Given A Publisher views access to a Resource
    And there are items in the Read access list
    When They click the "remove" button for an item in the Read access list
    Then they see the user is removed from the  Write access list

  Scenario: A Publisher grants read access to a everyone on the instittion for a Resource
    Given A Publisher views access to a Resource
    And the resource is not published
    When They click the "add" button for the Read access list
    And they click on the "everyone at the institution" option on the button
    Then they see the institution in the Read access list
