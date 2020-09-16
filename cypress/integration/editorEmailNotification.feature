@notImplemented
Feature: Editor email

  Scenario: An Editor activates email notifications
    Given An Editor views the "profile" page
    When they click the "activate" button
    Then they can receive email notifications

  Scenario: An Editor activates email notifications
    Given An Editor views the "profile" page
    When they click the "deactivate" button
    Then they do not longer receive email notifications