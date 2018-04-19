require 'site_prism'

class AddLDAPConfigOverlay < SitePrism::Section
		element :host_field, :css, "input[name='host_0']"
		element :manager_dn, :css, "input[name='managerDN']"
		element :manager_psw, :css, "input[name='managerPassword']"
		element :next_button, "//*[contains(text(),'Next')]"
end

class ConfigLDAPluginOverlay < SitePrism::Section
		element :login_name_attribute, :css, "input[name='loginNameAttr']"
		element :user_base_dn, :css, "input[name='userBaseDN']"
		element :group_base_dn, :css, "input[name='groupBaseDN']"
		element :user_filter, :css, "input[name='extraUserFilter']"
		element :group_filter, :css, "input[name='extraGroupFilter']"
		element :next_button, "//*[contains(text(),'Next')]"
end