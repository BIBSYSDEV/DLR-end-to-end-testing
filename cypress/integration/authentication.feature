@notImplemented
Feature:  Authentication

  Scenario: A User is logged in
    Given a User is on any page
    When they click on the "log in" button
    Then they are redirected to Dataporten
    When they complete the steps required to log in to Dataporten
    Then they are redirected back to "front" page
    And they see their "full name" in the Header
    When they click the "full name" in the Header
    Then they see a menu containing
      | Profile-link     |
      | "log out" button |

  Scenario: A User logs out
    Given A User is logged in
    When they click on the "full name" button in the Header
    When they click the "log out" button
    Then they are redirected to Dataporten
    And they see a message telling that they are logged out of the application

#TODO user not logged tries to open an edit page

