@notImplemented
Feature:resource deletetion

  Scenario: A Publisher deletes a resource
    Given A Publisher views their published Resource Item
    When they click on the "delete" button
    Then they are routed to the "delete confirmation" page
    And they see a warning text and a "delete" button
    When they click the "delete" button
    Then they are routed to the "front" page
    When they navigates to the "my resources" page
    Then the resource is not found

  # todo - add more cases (there is some logic around versioning), add case for editor