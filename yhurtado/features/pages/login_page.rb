class LoginPage < SitePrism::Page
  set_url('/')
  element :username, '#username'
  element :password, '#passwrd'
  element :login_button, '#loginButton'
  
  def login_with usr, pwd
      username.set usr
      password.set pwd
      login_button.click
  end
end
