Feature: Admin can see other users' advs

    Scenario: List other advs
        Given Another user have created a bikeadv
        Given I am authenticated
        When I follow "See users profiles"
        And I follow "See bike advertisements"
        Then I should be on the other user Bike Advertisements List Page
        And I should see "Bmw"
        And I should see "Gs"