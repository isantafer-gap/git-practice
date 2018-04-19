class InfrastructurePage < SitePrism::Page 
	set_url('/zport/dmd/itinfrastructure')
	element :device_list, "*//div[@id='device_grid-body']" 
	element :add_devices_button, "*//div[@id='adddevice-button']"
	element :add_device_options, "*//div[@id='addsingledevice-item']"
	element :add_single_device, "*//div[@id='addsingledevice-item']"
	element :add_device_modal, "*//div[@class='x-css-shadow']"
	element :device_ip_address, "//*[@id='add-device-name-inputEl']"
	element :device_class, "//*[@id='add-device_class-inputEl']"
	element :more_link, "//*[text()='More...']"
	element :server_username, "//*[@id='zCommandUsername-inputEl']"
	element :server_password, "//*[@id='zCommandPassword-inputEl']"
	element :add_button, "//*[text()='Add']"
	element :refresh, "//*[text()='Refresh']"
end 
