@notImplemented
Feature: Change ownership

  Scenario: A Publisher changes owner of a resource
    Given A Publisher views their published Resource Item
    When they click on the "change owner" button
    Then they are routed to the  "change owner" page
    And they see a form with a "user" field and a "confirm" button
    When they enter some text in the "user" field
    And they click the "confirm" button
    Then they see a confirmation that the ownership is changed
    And they are routed back to the "front" page
