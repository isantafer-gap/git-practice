Feature: Login Action

Scenario: Attempt to login with invalid credentials
	Given User navigate to Login Page
	When User enters invalid Username and Password:

	| username         | password    |
        | notvalidusername | notvalidpwd |

	And User clicks Login button
	Then Error message is displayed 

Scenario: Attempt to login without username
	Given User navigate to Login Page
	And User enters Password only:

	| password    |
	| password123 |

	And User clicks Login button
	Then Error message is displayed

Scenario: Attempt to login without password
	Given User navigate to Login Page
	And User enters Username only:

	| username    |
	| username123 |

	And User clicks Login button
	Then Error message is displayed

Scenario: Add a Server Linux device and see the device on the Infrastructure list
	Given User navigate to Login Page
	When User enters Valid Username and Password:

	| username | password |
	| admin    | Zenoss22 |

	And User clicks Login button
	And User clicks INFRASTRUCTURE tab
	And User clicks Add Device button
	And User clicks Add a Single Device button
	Given User adds single device with the following values:

	| ip            |    title   |    deviceclass    |
    	| 10.88.121.239 | dnieto-tb2 | /Server/SSH/Linux |
	
	Then User clicks add button
	Then User performs Logout process
