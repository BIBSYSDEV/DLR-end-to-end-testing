@notImplemented
Feature:resource sharing

  Scenario: A User views resource sharing
    Given A User views a Resource Item
    When they click on "share" tab
    Then they see a tab containing
      | Social links |
      | Embed code   |
      | Handle link  |

  Scenario Outline: A User changes embed code
    Given A User views resource sharing
    When they select a <EmbedSize>
    Then the Embed Code is changed based on <EmbedSize>
    Examples:
      | EmbedSize             |
      | Small (560 x 315)     |
      | Small with full width |
      | Medium (640 x 360)    |
      | Large (853 x 480)     |