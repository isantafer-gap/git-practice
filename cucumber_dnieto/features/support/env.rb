require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'

Capybara.configure do |config|
	config.app_host = "https://zenoss5.auto-set6-vm1.zenoss.lab"
	config.default_driver = :selenium_chrome
	config.default_max_wait_time = 10
	config.default_selector = :xpath
	config.run_server = false
end

Capybara.register_driver :selenium_chrome do |app|
	#Selenium::WebDriver::Chrome.driver_path = 'C:\driverss\chromedriver.exe'
	Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :selenium_firefox do |app|
	#Selenium::WebDriver::Firefox.driver_path = 'webdrivers/geckodriver'
	Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
end