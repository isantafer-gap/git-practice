Feature: Login possibilities within the Zenoss Resmgr without the necessary/invalid credentials

	Background:
		Given  I am located within the Zenoss Resmgr Login Page
	
	Scenario: Login Using Invalid Credentials
		When I enter an incorrect username
		And I enter an incorrect password
		And I enter the submit button
		Then A message should appear 

	Scenario: Login Using No Username
		When I don't enter a Username
		And I enter a valid password
		And I enter the submit button
		Then A message should appear
			

	Scenario: Login Using No Password
                When I don't enter a password
                And I enter a valid Username
                And I enter the submit button
                Then A message should appear
	
	Scenario: Logout from Resmgr
		When I  enter a valid password
                And I enter a valid Username
                And I enter the submit button
                Then the Dashboard page should be displayed
		When I click Log Out
		Then I see the login page




