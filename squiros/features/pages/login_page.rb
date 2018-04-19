require 'site_prism'

class LoginPage < SitePrism::Page

  set_url("/")

  element :username, :xpath, "//*[@id='username']"
  element :password, :xpath, "//*[@id='passwrd']"
  element :login_button, :xpath, "//*[@id='loginButton']"

  def set_username(user)
      username.set user
  end

  def set_password(pass)
    password.set pass
  end

  def set_login_data(user, pass)
    username.set user
    password.set pass
  end

  def login_click()
    login_button.click
  end

end
