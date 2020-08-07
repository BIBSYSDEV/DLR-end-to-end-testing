Scenario: A User views the "front" page
  Given a User navigates to the "front" page
  Then they see the "front" page containing
  | Logo                                    |
  | Language swap button                    |
  | Font size choice                        |
  | Welcome text                            |
  | "search" field                          |
  | "search" button                         |
  | List of recently created resources      |

Scenario: A User enters a Query in the "search" field
  Given a User is on the "front" page
  When they type a Query in the "search" field
  Then they see the Query in the "search" Field