require 'site_prism'
require_relative 'advanced_page_sections'

class AdvancedPage < SitePrism::Page
	set_url "/zport/dmd/manageLDAPConfig"
	element :ldap, :css, "a[href='/zport/dmd/manageLDAPConfig']"
	element :add_button, :css, "div[id='ldapaddbutton']"
	element :finish_button, "//*[contains(text(),'Finish')]"

	section :add_ldap, AddLDAPConfigOverlay, :css, 'div.x-window'
    section :config_ldap_plugin, ConfigLDAPluginOverlay, :css, 'div.x-window'

    def add_login_name_attr attribute
		xpath_device_class = '//li[contains(text(),"'+ attribute + '")]'
		find(:xpath, xpath_device_class).click
	end

end
