class InfrastructurePage < SitePrism::Page

  set_url('/zport/dmd/itinfrastructure')

  element :add_device_button, 'button#adddevice-button-btnEl'
  element :add_singledevice_menu, 'a#addsingledevice-item-itemEl'
  element :add_singledevice_submit, 'button#addsingledevice-submit-btnEl'
  element :model_device_checkbox, 'input#add-device-protocol-inputEl'
  element :refresh_button, 'button#refreshdevice-button-btnEl'
  element :flaire_message_jobs, 'div[id^="tooltip"].x-tip-body-default'
  element :devices_grid, 'device_grid-body'
  element :modal_form, 'div[id^="form"]'

  def add_single_device ip, device_class
    xpath_device_classs = '//li[contains(text(),"'+ device_class + '")]'
    wait_until_add_device_button_visible
    add_device_button.click
    wait_until_add_singledevice_menu_visible
    add_singledevice_menu.click
    wait_until_modal_form_visible
    fill_in 'deviceName', with: ip
    fill_in 'deviceClass', with: device_class
    find(:xpath, xpath_device_classs).click
    model_device_checkbox.click
    add_singledevice_submit.click
    wait_until_flaire_message_jobs_visible
    puts flaire_message_jobs.text
  end

  #not implemented/used, checked device with have_content
  def is_device_listed? ip, device_class
    refresh_button.click
    fill_in 'device_grid-filter-ipAddress-inputEl', with: ip
    refresh_button.click
  end
end
