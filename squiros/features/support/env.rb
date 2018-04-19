require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/rspec'
require 'site_prism'

Capybara.configure do |config|
  config.app_host = 'https://zenoss5.ip-10-111-2-219.zenoss.loc'
  config.default_driver = :selenium_chrome
	config.default_max_wait_time = 10
  config.default_selector = :xpath
	config.run_server = false
end

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--start-maximized")
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end
