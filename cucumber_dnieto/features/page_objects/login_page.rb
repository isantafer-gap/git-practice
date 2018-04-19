require 'site_prism'

class LoginPage < SitePrism::Page
	set_url "/"
	element :username_field, :css, "input[name='__ac_name']"
	element :password_field, :css, "input[name='__ac_password']"
	element :login_button, :css, "input[id='loginButton']"
end