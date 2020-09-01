Feature: Simple search

  Scenario: A User searches for Resources
    Given a User is on the "front" page
    When they type a Query in the "search" field and click Search
    Then they see a Result List of Resoures
    And they see the Query in the "search" Field
    And they see options to sort by Filter
    And they see options to view by View Mode

  #TODO: filter and view mode is other features