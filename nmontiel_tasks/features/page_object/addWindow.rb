class Addwindow < SitePrism::Section

	#element :modal,"//*[contains(@class,'x-window-closable')]"
	element :dropdown, "//*[@id='add-device_class-triggerWrap']//following-sibling::td//div"
	element :hostname, "//*[@id='add-device-name-inputEl']"
	element :device_title,"//*[(@name='title')]"
	element :btn_add,"//*[@id='addsingledevice-submit']"

	def select_device_class(class_name)
		page.find("//div//li[text()='%s']" % class_name).click
	end
end 