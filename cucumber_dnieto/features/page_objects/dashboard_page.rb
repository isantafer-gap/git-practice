require 'site_prism'

class DashboardPage < SitePrism::Page
	set_url "/zport/dmd/Dashboard"
	element :logout_button, :css, "div[id='sign-out-link']"
	element :infrastructure_button, :css, "a[id='Infrastructure-nav-button']"
	element :advance_button, :css, "a[id='Advanced-nav-button']"
end