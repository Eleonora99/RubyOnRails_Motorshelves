Feature: Admin can ban an user

Scenario: Ban an user
    Given Another user have created a bikeadv
    Given I am authenticated
    Given I am an admin
    When I follow "See users profiles"
    Then I should see "Gianni"
    When I follow "Ban"
    Then I should see "Remove Ban"