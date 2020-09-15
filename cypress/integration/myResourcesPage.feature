@notImplemented
Feature: my resource page

  Scenario: A User views "my resources" page
    Given A User is logged in
    When they click on the "my resources" link
    Then they are routed to the "my resources" page
    And they see a "new sumbission" button
    And they see tabs for
      | Unpublished resources    |
      | Published resources      |
      | Resources shared with me |
    And the tab for "Unpublished resources" is open
    And the tab contains a list of unpublished resources containing
      | Resource name |
      | Created date  |
      | edit button   |
      | delete button |

  Scenario: A User views published resources
    Given A User views "my resources" page
    When they click on the "Published resources" tab
    Then they see the tab content for "Published resources" with a list of unpublished resources containing
      | Resource name  |
      | Citation       |
      | Published date |
      | Created date   |
      | edit button    |
      | delete button  |

  Scenario: A User views published resources shared with the User
    Given A User views "my resources" page
    When they click on the "Resources shared with me" tab
    Then they see the tab content for "Resources shared with me" with a list of resources containing
      | Resource name          |
      | read access indicator  |
      | write access indicator |

  Scenario: A User starts a new submission from my resources
    Given A User views "my resources" page
    When they click on the "new submission" button
    Then they are routed to the "new submission" page

  Scenario: A User clicks edit unpublished resource
    Given A User views "my resources" page
    When they click on the "edit" button on one of the resources in the Unpublished resources list
    Then they are routed to the "edit resource" page

  Scenario: A User deletes unpublished resource
    Given A User views "my resources" page
    When they click on the "delete" button on one of the Resources in the Unpublished resources list
    And they confirms the deletion
    Then they see the Resource is gone from the list
		#todo Trengs det beskrivelse av hva som skjer med ressursen ?

  Scenario: A User clicks edit published resource
    Given A User views "my resources" page
    When they click on the "edit" button on one of the resources in the Published resources list
    Then they are routed to the "edit resource" page

  Scenario: A User deletes published resource
    Given A User views "my resources" page
    When they click on the "delete" button on one of the Resources in the Published resources list
    And they confirms the deletion
    Then they see the Resource is gone from the list
		#todo Trengs det beskrivelse av hva som skjer med ressursen ? Hva skjer når erssuresn er publisert ?

