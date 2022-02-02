Feature: User can search for a bike 

    Scenario: Find a Bmw
        Given Another user have created a bikeadv
        Given I am authenticated
        When I follow "Look for a new Bike"
        When I fill in "par" with "Bmw"
        And I should see "Bmw"
    
