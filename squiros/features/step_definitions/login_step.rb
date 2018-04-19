Given (/^I am on the Zenoss loginpage$/) do
  @login = LoginPage.new
  @login.load # visit("/")
  expect(@login.title).to eq("Login")
end

When (/^enter this "(.*?)" invalid username$/) do |user|
  #find(:xpath, "//*[@id='username']").set("my_username")
  # fill_in('username', :with => user)
  @login.set_username(user)
end

And (/^enter this "(.*?)" invalid password$/) do |pass|
  # find(:xpath, "//*[@id='passwrd']").set(pass)
  # fill_in('passwrd', :with => 'Zenoss')
  @login.set_password(pass)
end

Then (/^some error login is shown, like this "(.*?)"$/) do |error_msj|
  #find(:xpath, '//*[@id="loginButton"]').click
  # click_button('loginButton')
  @login.login_click()
  # puts find(:xpath, '//*[@id="errorbox"]/span').text
  # has_css?('.error')
  # has_content?('entered an incorrect username or password')
  expect(@login).to have_text error_msj
end

When (/^enter this "(.*?)" valid password$/) do |pass|
  # fill_in('passwrd', :with => pass)
  @login.set_password(pass)
end


When (/^enter this "(.*?)" valid username$/) do |user|
  # fill_in('username', :with => user)
  @login.set_username(user)
end

Then (/^enter with valid username and password:$/) do |table|
  table_hash = table.hashes
  # fill_in('username', :with => table_hash[0]['username'])
  # fill_in('passwrd', :with => table_hash[0]['password'])
  @login.set_login_data(table_hash[0]['username'], table_hash[0]['password'])
  # click_button('loginButton')
  @login.login_click()
end

Then (/^I am on the Zenoss page$/) do
  @dashboard = Dashboard.new
  @dashboard.load
  # page.has_title?('Zenoss: Dashboard')
  expect(@dashboard.title).to eq("Zenoss: Dashboard")
end

When (/^I click the SIGN OUT button$/) do
  # find(:xpath, '//*[@id="sign-out-link"]').click
  @dashboard.sign_out()
end
