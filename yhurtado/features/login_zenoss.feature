Feature: Attempt to login without username/password and incorrect credentials

  Background:
    Given I am on the login page

  Scenario Outline: Logins attempt
    When I fill in username with <usr>
    And I fill in password with <passwd>
    And I click in log in button
    Then I should see the message <msg>

    Examples:
      |      usr     |      passwd      |         msg         |
      |              |       12         |    Need username    |
      |      user    |                  |    Need password    |
      | invalid_user | invalid_password | Your session has expired or you have entered an incorrect username or password.|

  Scenario: Sign out attempt
    When I fill in username with admin
    And I fill in password with Zenoss22
    And I click in log in button
    Then I should be on the dashboard page
    When I click in SING OUT button
    Then I am on the login page
