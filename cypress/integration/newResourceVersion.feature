@notImplemented
Feature:

  Scenario: A Publisher starts to create a new version
    Given A Publisher views their published Resource Item
    And that Item is published
    When they click on the "create new version" button
    Then they are routed to the "new version" page
    And they see tabs for
      | copy master           |
      | copy all              |
      | replace with new file |
      | replace with new link |

  Scenario: A Publisher creates a new version based on master data
    Given A Publisher starts to create a new version
    When they click on the "copy master" tab
    And they click on the "create" button
    Then they are routed to the "edit" page
    And they see that all fields are the same as on the original resource
    And the Access and License fields is not set
		# ta med publisering og sjekk ?

  Scenario: A Publisher creates a new version based on non-generated data
    Given A Publisher starts to create a new version
    When they click on the "copy all" tab
    And they click on the "create" button
    Then they are routed to the "edit" page
    And they see that all fields are the same as on the original resource
    And the Access and License fields is not set
		# ta med publisering og sjekk ?

  Scenario: A Publisher creates a new version with a new file
    Given A Publisher starts to create a new version
    When they click on the "replace with new file" tab
    Then they see a "choose file" button
    When they press the "choose file" button
    Then they see a file dialog
    When they select a file in the file dialog
    Then they can see the filename and a "create" button
    When they press the "create" button
    Then they are routed to the Resource "edit" page
    And they see that all fields are the same as on the original resource
		# ta med publisering og sjekk ?

  Scenario: A Publisher creates a new version with a new link
    Given A Publisher starts to create a new version
    When they click on the "replace with new link" tab
    Then they see a "link" field
    When they enter a Link in the "link" field
    And they press the "select" button
    Then they are routed to the Resource "edit" page
    And they see that all fields are the same as on the original resource
    And the Access and License fields is not set
		# ta med publisering og sjekk ?
