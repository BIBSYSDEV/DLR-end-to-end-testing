@notImplemented
Feature: detail page

#Describes detail page content - not actions

  Scenario: A User views a Resource Item
    Given A User searches for Resources
    When they click on an Result Item
    Then they are routed to the "resource detail" page for the Resource
    And they see
      | Preview image         |
      | Title                 |
      | Creator               |
      | Handle link           |
      | Published date        |
      | Publisher Institution |
      | Description           |
      | Resource type         |
      | Tags                  |
      | Licence               |
      | Social links          |
      | Number of views       |
      | Tab for Citing        |
      | Tab for Contents      |
      | Tab for Sharing       |
      | Tab for Versions      |

  Scenario: A User clicks on a Creator link on the "resource detail" page
    Given A User views a Resource Item
    When they click on a Creator
    Then they are routed to the "front" page
    And they see a Result List based on a Search for the Creators name

  Scenario: A User clicks on a Tag link on the "resource detail" page
    Given A User views a Resource Item
    When they click on a Tag
    Then they are routed to the "front" page
    And they see a Result List based on a Search for the Tag

  Scenario: A User views Resource citing
    Given A User views a Resource Item
    When they click on "cite" tab
    Then they see a Cite

	# TODO ? scenario for testing social links

  Scenario: A User views Resource versions
    Given A User views Resource Content
    When they click on "versions" tab
    Then they see a list of resources containing
      | Thumbnail      |
      | Published date |
      | "open" button  |
    And the list is sorted by newest to oldest

  Scenario: A User opens older Resource versions
    Given A User views Resource Content
    When they click on "open" button for a Resource Item from the list
    Then they are routed to the the "resource detail" page for this Resource Item

  Scenario: A Publisher views their published Resource Item
    Given A User is logged in
    And they have Role Publisher
    And they opens a "resource detail" page for a Resource they own
    Then they see
      | Edit button               |
      | Create new version button |
      | Request DOI button        |
      | Delete button             |
      | Change Owner button       |
      | Access tab                |
      | Events tab                |
	# in addition to what a non-publisher sees

  Scenario: A Publisher views events for a Resource
    Given A Publisher views their published Resource Item
    When they click the "events" tab
    Then they see a list of all the events for the Resource

  Scenario: A Publisher edits a resource
    Given A Publisher views their published Resource Item
    When they click on the "edit" button
    Then they are routed to the "edit" page

