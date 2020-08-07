Feature: test
#rewritten feature for testing possibilities

Scenario: A User enters a Query in the "search" field
  Given a User is on the "front" page
  When they type a Query in the "search" field they click Search
  Then they see a Result List of Resources
