Feature: Testing add new single device

	Background: 
	Given I am in the login page

	
	Scenario: Add Single device
	When I type a correct username "admin"
	And I type a correct password "Zenoss22"
	And I press the submit button
	Then the Dashboard page should be displayed
	When I go to Infraestructure page
	Then the device list should be displayed
	When I click on Add button
	And I click on Add single device button
	Then the Add a Single Device modal should be displayed
	When I search for the device class "/Server/Linux"
	And I type a hostname "test-rhel6.zenoss.loc"
	And I type the device title "test-rhel6.zenoss.loc" 
	And I click on Add device button
	And I search for the device added "test-rhel6.zenoss.loc"
	

