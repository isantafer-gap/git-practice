
class Login < SitePrism::Page
set_url "/"

element :user_name, "//*[@id='username']" 
element :password, "//*[@id='passwrd']" 
element :submit, "//*[@id=\"loginButton\"]" 
element :message, "//*[contains(@class, 'error')]"

end