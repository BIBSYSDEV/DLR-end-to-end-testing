@notImplemented
Feature: main page content
# not actions (only links)

  Scenario: A User views the "front" page
    Given a User navigates to the "front" page
    Then they see the "front" page containing
      | Logo                               |
      | Language swap button               |
      | Font size choice                   |
      | Welcome text                       |
      | "search" field                     |
      | "search" button                    |
      | List of recently created resources |

