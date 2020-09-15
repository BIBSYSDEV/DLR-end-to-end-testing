@notImplemented
Feature: Reporting

  Scenario: A User reports a resource
    Given A User is logged in
    And they opens a "resource detail" page
    And they are not the owner of the Resource
    And they have access to the resource
    Then they see a "report" tab
    When they click the report tab
    Then they see a form with a reason field and a report button
    When they enter some text in the "reason" field
    And they click the "report" button
    Then they see a confirmation that the report is sent
    And the form is reset

  Scenario: An Editor views reports
    Given A User is logged in
    And they have Role Editor
    When they click the "editor" button
    Then they are routed to the "reports" page
    And the see a list of Reports containing
      | open button          |
      | submitter            |
      | submitted date       |
      | comment              |
      | edit button          |
      | ignore toggle button |

  Scenario: An Editor ignores a report
    Given An Editor views reports
    When they click the "ignore" button on one of the Reports in the Reports List
    Then the report is ignored
	  	#ingen "are you sure"!

  Scenario: An Editor edits a Resource
    Given An Editor views reports
    When they click the "edit" button on one of the Reports in the Reports List
    Then they are routed to the resource "edit" page

  Scenario: An Editor opens a Resource
    Given An Editor views reports
    When they click the "open" button on one of the Reports in the Reports List
    Then they are routed to the "resource detail" page
