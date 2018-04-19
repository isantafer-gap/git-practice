require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'rspec'
require 'site_prism'
require 'selenium-webdriver'

Capybara.configure do |config|
  config.app_host = 'https://yhurtado-tb1.zenoss.lab:54321'
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 10
  config.default_selector = :css
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
