Feature: Kaltura integration

  @changesState
  Scenario: All videos published in DLR by Kaltura-affiliated users should also be published in Kaltura
    Given A publisher who is affiliated with institutions who use Kaltura is logged in
    And starts a registration
    And registers a video
    When they perform the publication
    Then the video is published in DLR
    When they open the resource content tab
    Then the Kaltura video has the correct embedding data

  Scenario: A user can view Kaltura videos who have been published from or imported in DLR
    When A user views a Kaltura video resource
    And they open the resource content tab
    Then the Kaltura video has the correct embedding data

  @notImplemented
  Scenario: A Publisher can publish a video in DLR from Kaltura link
    Given A publisher is logged in
    And starts a registration
    And registers a link to Kaltura
    When they perform the publication
    And they open the newly published resource
    And they open the resource content tab
    Then a Kaltura URL is shown in the section for generated content
    And has the correct embedding data

  Scenario: A Kaltura-affiliated publisher can view a list of their own Kaltura videos in DLR
    Given A publisher who is affiliated with institutions who use Kaltura is logged in
    And starts a registration
    When they click on the tab named Kaltura
    Then they see a list of all the videos in Kaltura that they own
    And each video that has not already been published in DLR has an import button next to it
    And the videos that are already published in DLR are not importable

  @changesState
  Scenario: A Kaltura-affiliated publisher can publish a video from list of their own Kaltura videos in DLR
    Given A publisher who is affiliated with institutions who use Kaltura is logged in
    And starts a registration
    When they click on the tab named Kaltura
    And click the import button on a Kaltura video from the list
    And they perform the publication
    Then the video is published in DLR
    When they open the resource content tab
    Then the Kaltura video has the correct embedding data
