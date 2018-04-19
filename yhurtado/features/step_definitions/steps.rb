Given /^I am on the login page$/ do
  @login = LoginPage.new
  @login.load
  expect(page.title).to eq('Login')
end

When /^I am on the Infrastructure page$/ do
  @infrastructure = InfrastructurePage.new
  @infrastructure.load
  expect(page.title).to eq('Zenoss: Devices')
end

When /^I am on the Advance page$/ do
  @advance = AdvancePage.new
  @advance.load
  expect(page.title).to eq('Zenoss: Settings')
end

Given /^I am logged in with "(.*?)" and "(.*?)"$/ do |username, password|
  @login = LoginPage.new
  @login.load
  @login.login_with username, password
  @dashboard = DashboardPage.new
end

Given /^I am logged in with admin user$/ do
  step 'I am logged in with "admin" and "Zenoss22"'
end

Given /^I fill in username with (.*?)$/ do |username|
  @login.username.set username
end

Given /^I fill in password with (.*?)$/ do |password|
  @login.password.set password
end

Given /^I click in log in button$/ do
  @login.login_button.click
  @dashboard = DashboardPage.new
end

Given /^I click on LDAP left menu$/ do
  click_link('LDAP')
end

When "I add a LDAP server with:" do |table|
  t_hash = table.hashes
  @advance.add_ldap_configuration(t_hash[0]['host'], t_hash[0]['manager DN'], t_hash[0]['manager PWD'])
end

When "I configure the LDAP with:" do |table|
  t_hash = table.hashes
  @advance.configure_ldap_plugin(t_hash[0]['users base DN'], t_hash[0]['groups base DN'])
end
  
When /^I map the LDAP group "(.*?)" with the role "(.*?)"$/ do |group, role|
  @advance.map_ldap_group(group, role)
  expect(@advance).not_to have_selector('div.x-window-default-plain')  
  click_link('LDAP')
end

Then "I should see the LDAP configuration with:" do |table| 
  t_hash = table.hashes
  expect(@advance.host_input.value).to eq(t_hash[0]['host'])
  expect(@advance.manager_dn_input.value).to eq(t_hash[0]['manager DN'])
end

Then /^I should see the message (.*?)$/ do |message|
  page_message = find(:css, 'span.error').text
  expect(page_message).to eq(message)
end

Then /^I should be on the dashboard page$/ do
  @dashboard = DashboardPage.new
  @dashboard.load
  expect(page.title).to eq('Zenoss: Dashboard')
end

Given /^I click in SING OUT button$/ do
  @dashboard.signout_button.click
end

Given /^I add a single device with ip:(.*?) and class:(.*?)$/ do |ip, device_class|
  @infrastructure.add_single_device ip, device_class
end

Then /^I should see device ip:(.*?) class:(.*?)$/ do |ip, device_class|
  @infrastructure.refresh_button.click
  page.should have_content(ip)
  page.should have_content(device_class)
end
