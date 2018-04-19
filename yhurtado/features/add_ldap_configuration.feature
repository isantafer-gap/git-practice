Feature: Add LDAP configuration

  Background:
    Given I am logged in with admin user
    And I am on the Advance page

  Scenario: LDAP configuration
    When I click on LDAP left menu
    And I add a LDAP server with:
      |           host              |                              manager DN                      | manager PWD |
      | test-win2008-ad.zenoss.loc  | CN=Administrator,CN=Users,DC=zenoss-testing,dc=zenoss,dc=loc |  D0gP0und!  |
    And I configure the LDAP with:
      |                users base DN                |                groups base DN                |
      | cn=users,dc=zenoss-testing,dc=zenoss,dc=loc |  cn=users,dc=zenoss-testing,dc=zenoss,dc=loc |
    And I map the LDAP group "" with the role ""
    Then I should see the LDAP configuration with:
      |            host            |                       manager DN                             |
      | test-win2008-ad.zenoss.loc | CN=Administrator,CN=Users,DC=zenoss-testing,dc=zenoss,dc=loc |
