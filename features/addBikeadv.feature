Feature: User can manually add a Bikeadv

Scenario: Add a bikeadv
    Given I am authenticated
    When I follow "Create an advertisement"
    Then I should be on the Create New Bikeadv Page
    When I fill in "Scuderia" with "BMW"
    When I fill in "Modello" with "GS"
    When I fill in "Cilindrata" with "R1200"
    When I press "Create"
    And I should see "Bmw"

