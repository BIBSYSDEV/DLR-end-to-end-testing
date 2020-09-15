@notImplemented
Feature: Editor actions

  Scenario: An Editor can edit a resource that is registered my someone else
    Given An Editor views the gallery containing list of Resoures by other creators from the Creators Institution
    When they click on a Resource
    Then they are routed to the "resource detail" page
    And they see the "edit" button
