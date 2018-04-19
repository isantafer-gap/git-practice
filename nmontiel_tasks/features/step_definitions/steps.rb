Given(/^I am in the login page/) do
   @login = Login.new
   @login.load
end

When(/^I type a correct username "(.*?)"$/) do |correctuser|
    @login.user_name.set correctuser
end

When(/^I type a correct password "(.*?)"$/) do |correctpasswd|
    @login.password.set correctpasswd
end

When("I press the submit button") do
  @login.submit.click
  @dashboard = Dashboard.new
end
    
Then("the Dashboard page should be displayed") do
    expect(@dashboard).to be_displayed
end

When("I go to Infraestructure page") do 
	@infraestructure = Infraestructure.new
    @infraestructure.tab.click
end

Then("the device list should be displayed") do
    expect(@infraestructure).to have_device_label
end

When("I click on Add button") do
	@infraestructure.add_devices.click
end

When("I click on Add single device button") do
	@infraestructure.single_device.click
end

Then("the Add a Single Device modal should be displayed") do
    #expect(@infraestructure.add_single).to have_modal
    expect(@infraestructure).to have_add_single
end

When(/^I search for the device class "(.*?)"$/) do |class_name|
	@infraestructure.add_single.dropdown.click
	@infraestructure.add_single.select_device_class(class_name)
end

When(/^I type a hostname "(.*?)"$/) do |host_name|
    @infraestructure.add_single.hostname.set host_name
end

When(/^I type the device title "(.*?)"$/) do |title|
    @infraestructure.add_single.device_title.set title
end

When("I click on Add device button") do
	@infraestructure.add_single.btn_add.click
end

When(/^I search for the device added "(.*?)"$/) do |device|
	@infraestructure.refresh.click
	@infraestructure.search.set device
	@infraestructure.find_device(device)
	expect(@infraestructure).to have_title(device)
end

