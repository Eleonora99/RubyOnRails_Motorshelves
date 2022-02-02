Feature: Banned user wants to delete his account

Scenario: Destroy account
    Given Banned user is authenticated
    Given I am banned
    When I follow "Delete Account"
    Then I should be on Log In Page
    And I try to authenticate
    Then I should be on Log In Page