@notImplemented
Feature: Curator creates doi

  Scenario: An Curator initiates creating a DOI
    Given A Curator views Worklist
    And there is content in the DOI-request list
    When they click the "create DOI" button
    Then they are routed to the "create doi" page
    Then they can see the a form
    And the form has the fields
      | Title         |
      | Description   |
      | Resource type |
      | Category      |
      | Keywords      |
      | Creators      |
      | Contributors  |
    And They can see "request doi" button

  Scenario: A Curator creates a DOI
    Given A Curator initiates creating a DOI
    When they click the "request DOI" button
    Then they are routed to the "resource detail" page
    And they can see a Handle-link on the page
    When they navigates to the "worklist" page
    Then the DOI request is removed from the DOI-request list