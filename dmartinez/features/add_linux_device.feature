Feature: Add a Infrastructure displayable Linux Server device to the RM instance 

Background:
	Given I am logged as an admin in RM using the username: admin and the password: Zenoss22 

Scenario: Adding the Linux Server Device
	When I click on the "Infrastructure" tab of the RM application
	Then I should be able to see a list of all the RM devices
	When I click on the "Add Devices" button 
	Then I should see a list of "Add Devices" options
	When I click on "Add a Single Device"
	Then I should be able to see a modal to enter device details
	When I  enter the Linux Server IP Address '10.88.120.20'
	And I should select the Device Class '/Server/SSH/Linux'
	Then I should click on 'More...'
	Then I should set as the zCommandUsername as 'root' and the zCommandPassword 'D0gP0und!'
	Then I should click on the 'Add'
	Then I should refresh the device list
	When I see the Infraestructure page displaying I should be able to see the Linux Server IP Address '10.88.120.20' just added
	
