@notImplemented
Feature: landing page content
# not actions (only links)

  Scenario: A user views a Landing page
    Given A user navigates to a "resource detail" page for a Resource
    And the Resource is published
    When they click on the "citation link"
    Then they are routed to the "landing" page
    And they see a content containing:
      | Title                 |
      | Creator               |
      | Citation link         |
      | Published date        |
      | Publisher Institution |
      | Description           |
      | Preview image         |
      | Licence information   |
      | Cite                  |
    And they see a list of Content each containing
      | thumbnail       |
      | file name       |
      | file type       |
      | download button |

