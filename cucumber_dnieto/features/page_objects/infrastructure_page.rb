require 'site_prism'

class InfrastructurePage < SitePrism::Page
	set_url "/zport/dmd/itinfrastructure"
	element :add_button, :css, "div[id='adddevice-button']"
	element :add_single_device, :css, "div[id='addsingledevice-item']"
	
	class AddSingleDeviceOverlay < SitePrism::Section
		element :hostname_field, :css, "input[id='add-device-name-inputEl']"
		element :title_field, :css, "input[name='title']"
		element :device_class_field, :css, "input[id='add-device_class-inputEl']"
		element :add_button, :css, "button[id='addsingledevice-submit-btnEl']"
	end

	section :add_overlay, AddSingleDeviceOverlay, :css, 'div.x-window'

	def add_device_class deviceclass
		xpath_device_class = '//li[contains(text(),"'+ deviceclass + '")]'
		find(:xpath, xpath_device_class).click
	end

end
