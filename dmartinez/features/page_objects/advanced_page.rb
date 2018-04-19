class AdvancedPage < SitePrism::Page 
	set_url('/zport/dmd/editSettings')
	element :advanced_list, "//*[contains(@class, 'tabtable')]" 
	element :plus_button, "//*[contains(@id, 'ldapaddbutton-btnIconEl')]"
	element :mask, "//*[@class='x-mask']"
	element :drop_down, "//*[@id='ldapConfigDropDown-inputEl']"
	
	class LDAPOptionsModal < SitePrism::Section
		element :host, "//*[@id='textfield-1177-inputEl']"
		element :manager, "//*[@id='exampletextfield-1173-inputEl']"
		element :manager_password, "//*[@id='password-1174-inputEl']"
		element :next, "//*[@id='password-1174-inputEl']"
		element :users_base_DN, "//*[@id='exampletextfield-1191-inputEl']"
		element :groups_base_DN, "//*[@id='exampletextfield-1192-inputEl']"
		element :host_added, "//*[@id='textfield-1158-inputEl']"
		element :option_added, "//*[@class='x-boundlist-item x-boundlist-selected']"
	end 

	section :ldap_modal, LDAPOptionsModal, "//*[text()='New LDAP Configuration']"
end