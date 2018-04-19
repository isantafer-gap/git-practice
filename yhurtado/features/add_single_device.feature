Feature: Add a single device

  Background:
    Given I am logged in with "admin" and "Zenoss22"

  Scenario: Logins 
    When I am on the Infrastructure page
    And I add a single device with ip:10.175.211.137 and class:/Server/SSH/Linux
    Then I should see device ip:10.175.211.137 class:/Server/SSH/Linux
