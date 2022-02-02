Feature: User wants to delete his adv

Scenario: Destroy an adv
    Given I have created a bikeadv
    Given I am on the Motorshelves Homepage
    When I follow "Your advertisements"
    Then I should be on the Bike Advertisements List Page
    When I follow "Destroy"
    Then I should not see my bikeadv