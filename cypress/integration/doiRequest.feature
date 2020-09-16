@notImplemented
Feature:Publisher requests a DOI

  Scenario: A Publisher requests a DOI
    Given A Publisher views their published Resource Item
    And that Item is published
    When they click on the "request DOI" button
    Then they are routed to the "request DOI" page
    And they see a form with a "comment" field and a "request DOI" button
    When they enter some text in the "comment" field
    And they click the "request DOI" button
    Then they see a confirmation that the request is sent
    And they are routed back to the "resource detail" page

  #TODO: is doi creation mocked ?