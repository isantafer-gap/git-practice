class AdvancePage < SitePrism::Page

  set_url('/zport/dmd/editSettings')

  element :add_ldap_button, 'button#ldapaddbutton-btnEl'
  element :host_input, 'input[name="host_0"]'
  element :manager_dn_input, 'input[name="managerDN"]'
  element :password_input, 'input[name="managerPassword"]'
  element :user_base_dn_input, 'input[name="userBaseDN"]'
  element :group_base_dn_input, 'input[name="groupBaseDN"]'
  element :add_ldap_title, :xpath, '//span[text()="1. Add LDAP Servers"]'
  element :configure_plugin_title, :xpath, '//span[text()="2. Configure LDAP Plugin"]'
  element :map_ldap_title, :xpath, '//span[text()="3. Map LDAP Groups to Local Groups"]'

  def add_ldap_configuration host, manager_dn, password
    wait_until_add_ldap_button_visible
    add_ldap_button.click
    within('div.x-window-default-plain') do
      wait_until_add_ldap_title_visible
      wait_until_host_input_visible
      wait_until_manager_dn_input_visible
      wait_until_password_input_visible
      host_input.set host
      manager_dn_input.set manager_dn
      password_input.set password
      click_link_or_button('Next')
    end
  end

  def configure_ldap_plugin users_base_dn, groups_base_dn
    within('div.x-window-default-plain') do
      wait_until_configure_plugin_title_visible
      wait_until_user_base_dn_input_visible
      wait_until_group_base_dn_input_visible
      user_base_dn_input.set users_base_dn
      group_base_dn_input.set groups_base_dn
      click_link_or_button('Next')
    end
  end

  def map_ldap_group group, role
    within('div.x-window-default-plain') do
      wait_until_map_ldap_title_visible
      click_link_or_button('Finish')
    end
  end

end
