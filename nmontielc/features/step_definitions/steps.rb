Given("I am on the login page") do
   @login = Login.new
   @login.load
end

When("I attent to login with invalid credentials") do
    expect(@login).to have_user_name
    @login.user_name.set "nora" 
    @login.password.set "123"
    #fill_in('username', :with => 'admin1')
    #fill_in('passwrd', :with => 'Zenoss')
end

When("I press the submit button") do
  @login.submit.click
  @dashboard = Dashboard.new
  #click_button('loginButton')
end

Then("A message is displayed") do
  expect(@login).to have_message
  #has_css?('.error')
end

When("I attent to login without type a username") do
    @login.user_name.set "" 
    #fill_in('username', :with => ' ')
end

When(/^the password is "(.*?)"/) do |password|
    @login.password.set "password"
    #fill_in('passwrd', :with => password)
end

When("I attent to login without type a password") do
      @login.password.set ""
    #fill_in('passwrd', :with => ' ')
end

When("the username is correct") do
    @login.user_name.set "admin"
     #fill_in('username', :with => 'admin')
end

When("I attent to login with correct credentials") do
      @login.user_name.set "admin"
      @login.password.set "Zenoss22"
      #fill_in('username', :with => 'admin')
      #fill_in('passwrd', :with => 'Zenoss22')
end

Then("the Dashboard page should be displayed") do
      expect(@dashboard).to be_displayed
     #has_css?('combobox-1060-labelEl')
end

Then("I press the logout button") do
      @dashboard.signout.click
    #click_on'sign out'
end

Then("I should be redirect to the login page") do
   expect(@login).to have_user_name
 	   #has_css?('username')
end