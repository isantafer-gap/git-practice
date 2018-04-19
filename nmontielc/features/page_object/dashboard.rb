class Dashboard < SitePrism::Page
set_url "/zport/dmd/?submitted=true"

element :title, "//*[@id='combobox-1060-labelEl']"
element :signout, "//*[contains(text(),'sign out')]"

end 