@notImplemented
Feature: resource content

  Scenario: A User views Resource content
    Given A User views a Resource Item
    When they click on "content" tab
    Then they see a list of files attached to the Resource containing
      | Thumbnail         |
      | Filename          |
      | Mimetype          |
      | "download" button |
      | "versions" button |

  Scenario: A User downloads content
    Given A User views Resource content
    When they click on "download" button for a Result List Item
    Then the file is downloaded on the users computer

  Scenario: A User views content versions
    Given A User views Resource content
    When they click on "versions" button for a Result List Item
    Then they see a list of the files previous versions conaining
      | Filename          |
      | Created date      |
      | "download" button |

  Scenario: A User downloads content from older versions
    Given A User views content versions
    When they click on "download" button for a Result List Item
    Then the file is downloaded on the users computer