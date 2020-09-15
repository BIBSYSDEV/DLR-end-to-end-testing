@notImplemented
Feature: Search

  Scenario: A User searches with descriptive metadata
    Given A User enters a Query in the "search" field
    And the Query contains descriptive metadata
    When they click Search
    Then they see a Result List based on that metadata
    And the Result List is also populated with results from the query as a freetext search

  Scenario: A User searches for Resources from a Creator
    Given A User enters a Query in the "search" field
    And the Query contains the name of a Creator
    When they click Search
    Then they see a Result List with Resources from the given Creator
    And the Result List is also populated with results from the query as a freetext search

  Scenario: A User searches for Resources from an Institution
    Given A User enters a Query in the "search" field
    And the Query contains the name of an Institution
    When they click Search
    Then they see a Result List with Resources from the given Institution
    And the Result List is also populated with results from the query as a freetext search

  Scenario Outline: A User sorts the Result List
    Given A User searches for Resources
    When they select a <Filter>
    Then the Result List is filtered based on that <Filter>
    Examples:
      | Filter                        |
      | Title (Descending)            |
      | Title (Ascending)             |
      | Publication date (Descending) |
      | Publication date (Ascending)  |

  Scenario Outline: A User views the Result List
    Given A User searches for Resources
    When they select a <View Mode>
    Then the Result List is shown in that <View Mode>
    Examples:
      | View Mode |
      | Grid View |
      | List View |

  Scenario: A User views the Result List in Grid View
    Given A User views the Result List
    When the View Mode is Grid View
    Then each Result item in the Result List contains fields
      | Thumbnail |
      | Title     |

  Scenario: A User views the Result List in List View
    Given A User views the Result List
    When the View Mode is List View
    Then each Result item in the Result List contains fields
      | Thumbnail     |
      | Title         |
      | Creator       |
      | Creation date |
      | Description   |
      | Tags          |

  Scenario: A User filters on a Tag
    Given A User views the Result List in List View
    When they click on a Tag on a result list Item
    Then they see a Result List based on a search for the Tag
    And The Tag filter shows up as a filter button

  Scenario: A User filters on a Creator
    Given A User views the Result List in List View
    When they click on a Creator link on a result list Item
    Then they see a Result List based on a search for the Creator
    And The Creator filter shows up as a filter button

  Scenario: A User removes a Search Filter
    Given A User views the Result List
    When they click on a Filter button
    Then the Filter button is removed
    And they see a Result List based on a search without the Filter

  Scenario: A User removes a Search Filter
    Given A User views the Result List
    Then they see that the result list is allready filtered by "open access"

  Scenario: A User views filter choices
    Given A User views the Result List
    When they click on the "filter" button
    Then they see a set of filters extracted from the Result List content
    And the set of filters contains filter buttons in the following categories
      | Intitution    |
      | License       |
      | Category      |
      | Resource type |
      | Contributor   |
      | Creator       |
    And the the filter buttons shows the number of Results from the Result List containing that filter value

  Scenario Outline: A User filters the Result List
    Given A User views filter choices
    When they click on a Filter button of type <Query Filter Category>
    Then they see the Result List is filtered on <Filter>
    And they see that the Filter shows up as a filter button
    Examples:
      | Query Filter Category | Filter      |
      | Intitution            | institution |
      | License               | license     |
      | Category              | subject     |
      | Resource type         | filetype    |
      | Contributor           | contributor |
      | Creator               | creator     |
