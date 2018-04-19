require_relative 'addWindow'

class Infraestructure < SitePrism::Page

	set_url "/zport/dmd/?submitted=true"
	section :add_single, Addwindow, "//*[contains(@class,'x-window-closable')]"

	element :tab, "//*[@id='Infrastructure-nav-button']"
	element :add_devices, "//button[@id='adddevice-button-btnEl']"
	element :single_device, "//*[@id='addsingledevice-item-textEl']"
	element :device_label, "//*[@id='device_panel_header-inputEl']"
	element :search, "//*[@id='device_grid-filter-name-inputEl']"
	element :refresh,"//*[@id='refreshdevice-button-btnInnerEl']"
	element :device_added,"//*[//div[contains(@class, 'x-grid-cell-inner ')]//*[contains(text(),'test-rhel6.zenoss.loc')]]"

	def find_device(device_added)
		page.find("//*[contains(@class, 'x-grid-cell-inner')]//*[contains(text(),'%s')]" % device_added).click
	end

end 