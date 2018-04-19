Given /^User navigate to Login Page$/ do
  @login_page = LoginPage.new
  @login_page.load
end

When /^User enters invalid Username and Password:$/ do |table|
  table_hash = table.hashes
  @login_page.username_field.set table_hash[0]['username']
  @login_page.password_field.set table_hash[0]['password']
end

And /^User clicks Login button$/ do
  @login_page.login_button.click
end

Then /^Error message is displayed$/ do
  expect(@login_page).to_not be_displayed 
end

And /^User enters Password only:$/ do |table|
  table_hash = table.hashes
  @login_page.password_field.set table_hash[0]['password']
end

And /^User enters Username only:$/ do |table|
  table_hash = table.hashes
  @login_page.username_field.set table_hash[0]['username']
end

When /^User enters Valid Username and Password:$/ do |table|
  table_hash = table.hashes
  @login_page.username_field.set table_hash[0]['username']
  @login_page.password_field.set table_hash[0]['password']
end

And /^User clicks INFRASTRUCTURE tab$/ do
  @dashboard_page = DashboardPage.new
  @dashboard_page.infrastructure_button.click
end

And /^User clicks Add Device button$/ do
  @infrastructure_page = InfrastructurePage.new
  sleep 5
  @infrastructure_page.add_button.click
end

And /^User clicks Add a Single Device button$/ do
  @infrastructure_page.add_single_device.click
  sleep 5
end

Given /^User adds single device with the following values:$/ do |table|
  table_hash = table.hashes
  @infrastructure_page.add_overlay.device_class_field.set table_hash[0]['deviceclass']
  @infrastructure_page.add_device_class(table_hash[0]['deviceclass'])
  @infrastructure_page.add_overlay.hostname_field.set table_hash[0]['ip']
  @infrastructure_page.add_overlay.title_field.set table_hash[0]['title']
  sleep 5
end

Then /^User clicks add button$/ do
  @infrastructure_page.add_overlay.add_button.click 
end

Then /^User performs Logout process$/ do
  sleep 60
  @dashboard_page.logout_button.click
end
