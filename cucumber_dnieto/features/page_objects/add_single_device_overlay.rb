require 'site_prism'

class AddSingleDeviceOverlay < SitePrism::Page
	set_url "/"
	element :hostname_field, :css, "input[id='add-device-name-inputEl']"
	element :title_field, :css, "input[name='title']"
	element :device_class_field, :css, "input[name='deviceClass']"
	element :add_button, :css, "button[id='addsingledevice-submit-btnEl']"
end