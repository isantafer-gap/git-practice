Given("I am logged as the admin in RM using the username: admin and the password: Zenoss{int}") do |int|
    @login_page = LoginPage.new 
    @login_page.load
    @login_page.username.set "admin"
    @login_page.passwrd.set "Zenoss22"
    @login_page.login_button.click
end

When("I click on the {string} section tab of the RM application") do |string|
  click_on string
end

Then("I should be able to see the Advanced Settings List") do
  @advanced = AdvancedPage.new
  expect(@advanced).to have_advanced_list
end

When("I click on the {string} option") do |string|
  click_on string
end

When("I click on the {string} symbol") do |string|
  @advanced.plus_button.click
end

Then("I should be able to see the {string} Modal") do |string|
  expect(@advanced).to have_xpath("//*[text()='"+string+"']")
end

When("I enter the LDAP credentials:") do |table|
data = table.raw

@advanced.ldap_modal.host.set data[1][0]
@advanced.ldap_modal.manager.set data[1][1]
@advanced.ldap_modal.manager_password.set data[1][2]

end

Then("Click on {string}") do |string|
  click_on string
end

Then("Enter the Configuration Details") do |table|
data = table.raw

@advanced.ldap_modal.users_base_DN.set data[1][0]
@advanced.ldap_modal.groups_base_DN.set data[1][1]

end

When("I see the Infraestructure page displaying I should be able to see the LDAP configuration for {string} available") do |string|
refresh_attempts = 9
refresh_attempts.times do
@advanced.drop_down.click
end
expect(@advanced).not_to have_mask
end