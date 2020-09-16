@notImplemented
Feature:  Describes curators work-list page content - not actions (only links)

  Scenario: A logged inn curator has the right role
    Given a Curator is logged in
    When they click the menu
    And they click the "profile" menu item
    Then they are routed to the "profile" page
    And the profile page contains a "roles" table with the text "Curator"

  Scenario: A Curator views Worklist
    Given A Curator is logged in
    When they click the "curator" button
    Then they are routed to the "worklist" page
    And they see a list of DOI-requests containing
      | open button       |
      | submitter         |
      | submitted date    |
      | comment           |
      | create DOI button |
      | reject button     |
    And the see a list of access-requests containing
      | open button    |
      | submitter      |
      | submitted date |
      | comment        |
      | grant button   |
      | reject button  |
    And the see a list of ownership-requests containing
      | open button            |
      | submitter              |
      | submitted date         |
      | comment                |
      | grant ownership button |
      | reject button          |

  Scenario: A Curator opens a resource from the DOI-request list
    Given A Curator views Worklist
    And there is content in the DOI-request list
    When they click the "open" button
    Then they are routed to the "resource detail" page

  Scenario: A Curator opens a resource from the access-request list
    Given A Curator views Worklist
    And there is content in the access-request list
    When they click the "open" button
    Then they are routed to the "resource detail" page

  Scenario: A Curator opens a resource from the ownership-request list
    Given A Curator views Worklist
    And there is content in the ownership-request list
    When they click the "open" button
    Then they are routed to the "resource detail" page

  Scenario: A Curator rejects a request from the DOI-request list
    Given A Curator views Worklist
    And there is content in the DOI-request list
    When they click the "reject" button
    Then the request is removed from the DOI-request list

  Scenario: A Curator rejects a request from the access-request list
    Given A Curator views Worklist
    And there is content in the access-request list
    When they click the "reject" button
    Then the request is removed from the access-request list

  Scenario: A Curator rejects a request from the ownership-request list
    Given A Curator views Worklist
    And there is content in the ownership-request list
    When they click the "reject" button
    Then the request is removed from the ownership-request list

  Scenario: A Curator accepts a request from the ownership-request list
    Given A Curator views Worklist
    And there is content in the ownership-request list
    When they click the "grant " button
    Then they see a confirmation that the request is granted
    And the request is removed from the ownership-request list



