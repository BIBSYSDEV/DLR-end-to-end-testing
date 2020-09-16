@notImplemented
Feature: Change page language

  Scenario: A User changes language
    Given A User views Any page
    When they click the "language swap" button
    Then the language on the page is changed
    And the text on the "language swap" button is changed
		#There are only two states/languages (norwegian and english)
