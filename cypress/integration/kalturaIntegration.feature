@notImplemented
Feature: Kaltura integration

  Scenario: Depending on institution affiliation - all videos published in DLR should also be published in Kaltura
    Given A publisher starts a registration
    And the registrator is affiliated with institutions who use Kaltura
    And registers a video
    When they perform the publication
    Then the video is stored in DLR
    And the video is stored in Kaltura
    And the video is published in DLR as a link to Kaltura

  Scenario: Viewing Kaltura videos who have been published from or imported in DLR
    Given A user views the Kaltura video resource
    Then the content tab contains a Kaltura URL in the section for generated content

  Scenario: A Publisher can publish a video in DLR from Kaltura link
    Given A publisher starts a registration
    And registers a link to Kaltura
    When they perform the publication
    Then the link is recognised as a link to Kaltura
    And the video is treated as a Kaltura video
    And has the correct embedding data

  Scenario: A Publisher can view a list of their own Kaltura videos in DLR
    Given A publisher starts a registration
    And the registrator is affiliated with institutions who use Kaltura
    When they click on the tab named Kaltura
    Then they see a list of all the videos in Kaltura that they own
    And it is easy to see which videos are already published in DLR
    And each video that has not already been published in DLR has an import button next to it
    And the videos that are already published in DLR are not importable

  Scenario: A Publisher can publish a video from list of their own Kaltura videos in DLR
    Given A publisher starts a registration
    And the registrator is affiliated with institutions who use Kaltura
    When they click on the tab named Kaltura
    And click the import button on a Kaltura video from the list
    And finish the registration
    And click the publish button
    Then the video is published in DLR
    And the video metadata is stored in DLR
    And the video is downloaded and stored in DLR
