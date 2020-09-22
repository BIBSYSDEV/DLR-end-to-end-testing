Feature:  A user communicates with a curator

  Scenario: A Publisher opens "contact curator" form
    Given A Publisher is logged in
    And they are on the "detail" page for a resource they own
    When they press the "contact curator" button
    Then they see a form where they can fill in a message
    And they see their email is filled in

  Scenario: A Publisher sends request to curator
    Given A Publisher has opened "contact curator" form
    And they fill inn a message
    When they submit the form
    Then the see a receipt

  Scenario: A Curator sees a communication request with a publisher
    Given A Curator is logged in
    And a publisher has sent a contact request
    When they navigate to on the "worklist" page
    Then they see a request from a publisher in the request list containing submitters email, comment, resource, delete button, respond in email program button
    And they see that the request list is sorted chronologically

  Scenario: A Curator triggers a communication request with a publisher
    Given A Curator sees a communication request from a publisher
    When they  click the "respond in email program" button for the request
    Then their email-program is opened
    And they see the subject, message and to-address is pre-filled in a draft email

  Scenario: A Curator deletes a communication request with a publisher
    Given a Curator sees a communication request from a publisher
    When they  click the "delete" button for the request
    Then they see the communication request is deleted from the request list

