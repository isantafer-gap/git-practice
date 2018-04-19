class DashboardPage < SitePrism::Page 
	set_url('/')
	element :logout_button, "//*[contains(text(),'sign out')]" 
	element :dashboard_page, "//*[contains(text(),'Infrastructure')]"
end