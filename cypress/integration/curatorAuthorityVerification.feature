@notImplemented
Feature: curator verifies authorities

  Scenario: A Curator views an edit page
    Given A Curator navigates to the "resource detail" page for a Resource
    When they click the "edit" button
    Then they are routed to the "edit" page
    And each item in the contributor list and the creator list containing
      | verified symbol |
      | authority field |
      | verify button   |

  Scenario: A Curator searches for authorities for creator
    Given  A Curator views an edit page
    And There are items in the creator list
    When they click the "verify" button
    Then they see a "query" field containing the creators name, and a search button
    When they click the search button
    Then they see a result list of verified items that matches the query
    And each items in the result list contains
      | name           |
      | details button |
      | verify button  |

  Scenario: A Curator verifies a creator
    Given  A Curator searches for authorities for creator
    And the result list contains authorities
    When they click on the "details" button
    Then they see information for the the authority including
      | system control number |
      | autid                 |
    When they click "verify" button
    Then they see that the  creator is verified
    And they see the authorities name in the authority field

  Scenario: A Curator searches for authorities for contributor
    Given  A Curator views an edit page
    And There are items in the contributor list
    When they click the "verify" button
    Then they see a "query" field containing the contributors name, and a search button
    When they click the search button
    Then they see a result list of verified items that matches the query
    And each items in the result list contains
      | name           |
      | details button |
      | verify button  |

  Scenario: A Curator verifies a contributor
    Given  A Curator searches for authorities for contributor
    And the result list contains authorities
    When they click on the "details" button
    Then they see a popup window containing information of the the authority
    When they click "verify" button
    Then they see that the contributor is verified
    And they see the authorities name in the authority field
