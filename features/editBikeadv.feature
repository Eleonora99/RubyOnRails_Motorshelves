Feature: User wants to edit his adv

Scenario: Edit adv
    Given I have created a bikeadv
    Given I am on the Motorshelves Homepage
    When I follow "Your advertisements"
    Then I should be on the Bike Advertisements List Page
    When I follow "Edit"
    And I should see "Scuderia"
    And I should see "Modello"
    When I fill in "City" with "Rome"
    When I press "Edit"
    And I should see "Rome"



