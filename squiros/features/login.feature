Feature: Zenoss Login
In order to Login in Zenoss we have to enter login details

	Scenario: Attempt to login with invalid credentials
		Given I am on the Zenoss loginpage
		When enter this "admin1" invalid username
		And enter this "1234567" invalid password
		Then some error login is shown, like this "entered an incorrect username or password"

	Scenario: Attempt to login without username
		Given I am on the Zenoss loginpage
		When enter this "SerMeds22" valid password
		Then some error login is shown, like this "entered an incorrect username or password"

	Scenario: Attempt to login without password
		Given I am on the Zenoss loginpage
		When enter this "admin" valid username
		Then some error login is shown, like this "entered an incorrect username or password"

	Scenario: Logout from resmgr
		Given I am on the Zenoss loginpage
		Then enter with valid username and password:
		| password      | username   |
		| SerMeds22     | admin      |
		Then I am on the Zenoss page
		When I click the SIGN OUT button
		Then I am on the Zenoss loginpage

