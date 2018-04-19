class LoginPage < SitePrism::Page 
 set_url('/')
 element :username, :xpath, "//*[@name='__ac_name']"
 element :passwrd, :xpath, "//*[@name='__ac_password']"
 element :login_button, :xpath, "//*[@name='submitbutton']"
 element :error, :xpath, "//*[contains(@class, 'error')]"
end

