@notImplemented
Feature: Registration

  Scenario: A Publisher starts a registration
    Given A User is logged in
    And they have Role Publisher
    When they click the "new submission" button
    Then they are routed to the "new submission" page
    And they see an active "file" tab containing a "upload file" button
    And they see a "link" tab

  Scenario: A Publisher starts a file registration
    Given A Publisher starts a registration
    When they click the "choose file" button
    Then they see a file dialog
    When they select a file in the file dialog
    Then they can see the filename and a "create" button
    When they click the "create" button
    Then they are routed to the Resource "edit" page
    Then they can see the "resource registration/edit" form
    And the form has the fields
      | Title         |
      | Description   |
      | Resource type |
      | Category      |
      | Keywords      |
      | Creators      |
      | Contributors  |
      | Access        |

  Scenario: A Publisher starts a link registration
    Given A Publisher starts a registration
    When they click the "link" tab
    Then they see a "link" field
    When they enters a Link in the "link" field
    And they click the "select" button
    Then they see a "create" button
    When they click the "create" button
    Then they are routed to the Resource "edit" page
    Then they can see the "resource registration/edit" form

  Scenario: A Publisher fills in mandatory fields in file registration
    Given A Publisher starts a file registration
    When they enter a title in the "title" field
    And they select a resource type from the resource type options
    And they click the "no" value in the "cleareance" field-group
    And they select a license
    Then the "publish" button is enabled

  Scenario: The file registration form is autofilled with metadata
    Given A Publisher starts a file registration
    Then the "title" field is filled out based on File Name
    Then the "resource type" field is preselected based on the File Type
    Then the "creator name" field is filled out with the Publishers Name
    Then the "contributor type" field is filled out with "hosting institution"
    Then the "contributor name" field is filled out with Publishers Institution
		#evt mer deklarativt:  Then the fields are filled out using metadata from the File

  Scenario: A Publisher removes a creator
    Given A Publisher starts a file registration
    When they click the "delete" button on the creator
    Then there are no creators listed in the Form

  Scenario: A Publisher adds a creator
    Given A Publisher starts a file registration
    When they click the "add creator" button
    Then they see a new "creator name" field
    And they see "delete" button for Creator
    When they fill out "creator name" field
    Then the form is saved

  Scenario: A Publisher reorders creators
    Given A Publisher starts a file registration
    And there are registered more than one creator
    Then they see an "move up" button after all other creators other than the first
    And they see a "save order" button
    When they click the "move up" button for a creator
    Then the creator is moved up, and the creator over is moved down
    When they click the "save order" button
    Then the form is saved

  Scenario: A Publisher removes a contributor
    Given A Publisher starts a file registration
    When they click the "delete" button on the contributor
    Then there are no contributors listed in the Form

  Scenario: A Publisher adds a contributor
    Given A Publisher starts a file registration
    When they click the "add contributor" button
    Then they see a new "contributor type" dropdown
    And they see a new "contributor name" field
    And they see "delete" button for Creator
    When they fill out "contributor name" field
    And they selects a "contributor type"
    Then the form is saved
		#TODO: value of select-boxes ?

  Scenario: A Publisher selecting that they have the intellectual property of the Resource
    Given A Publisher starts a file registration
    When they click the "yes" button for the "Does the resource contain the intellectual property of others(...)" option
    Then they see choices for "Do you have the rights(...)"

  Scenario: A Publisher selecting that they don't have the intellectual property of the Resource
    Given A Publisher starts a file registration
    When they click the "no" button for the "Does the resource contain the intellectual property of others(...)" option
    Then they see Access options containing choices
      | restricted |
      | public     |
    And the see "add" button for read access for the resource		And They sees licenses to be selected

  Scenario: A Publisher selecting that they have the right to publish
    Given A Publisher selecting that they have the intellectual property of the Resource
    When they click the "yes" button for the "Do you have the rights(...)" option
    Then they see Access options containing choices
      | restricted |
      | public     |
    And the see "add" button for read access for the resource
    And They sees licenses to be selected

  Scenario: A Publisher selecting that they don't have the right to publish
    Given A Publisher selecting that they have the intellectual property of the Resource
    When they click the "no" button for the "Do you have the rights(...)" option
    Then they see Access options containing choices
      | restricted |
    And the see "add" button for read access for the resource
    And They sees licenses to be selected added by the Publishers Institution

  Scenario: A Publisher click the "add read access" button to the resource
    Given A Publisher selecting that they have the intellectual property of the Resource
    When they click the "add" button
    Then they see Access options containing choices
      | everyone on the Publishers Institution |
      | user                                   |

  Scenario: A Publisher adds institutional reading rights
    Given A Publisher click the "add read access" button to the resource
    When they select "everyone on the Publishers Institution"
    Then they see the Publishers Institution in a list of read access
    And they see the Publishers Institution with type, name, duration and "remove" button
    And they see Access options containing choices
      | user |

  Scenario: A Publisher adds user reading rights
    Given A Publisher click the "add read access" button to the resource
    When they select "user"
    Then they see a "user" field
    When they enter a valid email or feideId in the "user" field
    And they click the "OK" button
    Then they see the User in a list of read access
    And they see the User with type, name, duration and "remove" button

  Scenario: A Publisher removes user reading rights
    Given A Publisher adds user reading rights
    When they click "remove" button
    Then they see the User is removed from the list of read access

  Scenario: A Publisher saves the Resource
    Given A Publisher starts a file registration
    When they click the "save" button
    Then they are routed to the "resource detail" page for the Resource
    And they see that the Resource is not published

  Scenario: A Publisher publishes the Resource
    Given A Publisher fills in mandatory fields in file registration
    When they click the "publish" button
    Then they are routed to the "resource detail" page for the Resource
    And they see that the Resource is published with date and institution

  Scenario: A Publisher publishes a Resource with an expiry Date
    Given A Publisher fills in mandatory fields in file registration
    And they enter an expiry date
    When they click the "publish" button
    Then they are routed to the "resource detail" page for the Resource
    And they see that the Resource has an expiry date

  Scenario: A Publisher can not edit expiry date on a published resource
    Given A Publisher publishes a Resource with an expiry Date
    When they click edit on the resource detail page
    Then the expiry field is not editable

  Scenario: A Curator views an expired resource
    Given A Publisher publishes a Resource with an expiry Date
    And that expiry date is in the past
    When they view the curator worklist page
    Then they see the Resource in the Expiry list

		#TODO: Doi-logikk ???