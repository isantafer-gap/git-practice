Given("I am located within the Zenoss Resmgr Login Page") do
    @login_page = LoginPage.new 
    @login_page.load
end

When("I enter an incorrect username") do
    #fill_in('username', :with => 'fake22')
    @login_page.username.set "fake22"
end

When("I enter an incorrect password") do
    #fill_in('passwrd', :with => 'Zenoss222')
    @login_page.passwrd.set "Zenoss222"
end

When("I enter the submit button") do
    #click_button('loginButton')
    @login_page.login_button.click
end

Then("A message should appear") do
    #page.has_xpath?('//*[contains(@class, "error")]')
    expect(@login_page).to have_error
end

When("I don't enter a Username") do
    #fill_in('username', :with => '')
    @login_page.username.set ""
end



When("I enter a valid password") do
    #fill_in('passwrd', :with => 'Zenoss22')
    @login_page.passwrd.set "Zenoss22"
end

When("I don't enter a password") do
    #fill_in('passwrd', :with => '')
    @login_page.passwrd.set ""
end

When("I enter a valid Username") do
    #fill_in('username', :with => 'admins')
    @login_page.username.set "admins"
end

When("I  enter a valid password") do
    #fill_in('passwrd', :with => 'Zenoss22')
    @login_page.passwrd.set "Zenoss22"
end

Then("the Dashboard page should be displayed") do
    #page.has_xpath?('//*[contains(@class, "bg")]')
    @dashboard = DashboardPage.new
    @dashboard.load
end

When("I click Log Out") do
    #click_link("sign out")
    @dashboard.logout_button.click
end

Then("I see the login page") do
    #page.has_xpath?('//*[contains(@class, "submitbutton")]')
    expect(@login_page).to have_login_button
end
