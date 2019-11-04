#encoding: UTF-8
require 'logger'
require 'bundler/setup'
require 'cucumber'
require 'capybara/cucumber'
require 'date'
require 'ostruct'
require 'selenium-webdriver'
require 'allure-cucumber'
require 'allure-ruby-commons'
require 'rspec'
require 'rspec-steps'
require 'capybara'
require 'capybara/dsl'
require 'true_automation/rspec'
require 'true_automation/driver/capybara'
require 'capybara-screenshot/cucumber'
require 'base64'
require 'fileutils'
require 'webdrivers/chromedriver'
require 'nokogiri'
require 'mail'

#===================================================== Capybara driver registration and adding of capabilities
mobile_emulation = {'deviceName' => 'iPhone X'}

caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: {mobileEmulation: mobile_emulation})
Capybara.register_driver(:true_automation_driver) do |app|

  options = Selenium::WebDriver::Chrome::Options.new

  #____Option to block screenshots
  # options.add_argument('%w = []')
  # options.add_argument('headless')
  # options.add_argument('disable-gpu')
  #
  options.add_emulation(device_name: 'iPhone X')
  options.add_argument('auto-open-devtools-for-tabs')
  # options.add_extension("features/data/plugins/har-export-trigger-master.crx")
  # Capybara::Selenium::Driver.new(app, :browser => :chrome, options: options)
  TrueAutomation::Driver::Capybara.new(app, options: options)

end

# World(TrueAutomation::DSL)
include TrueAutomation::DSL
World(Capybara::DSL)

#===================================================== Capybara default options

Capybara.default_max_wait_time = 12
Capybara.default_driver = :true_automation_driver

#===================================================== Allure configurations

ALLURE_RESULTS_DIR = 'gen/allure-results'
Allure.configure do |c|
  c.results_directory = ALLURE_RESULTS_DIR
end
# Method and constant will be triggered in hooks.rb file
CLEAR_ALLURE_DIRECTORY = true
def clear_allure_directory
  if File.exists?(ALLURE_RESULTS_DIR)
    FileUtils.rm_rf(ALLURE_RESULTS_DIR)
    p "Allure results directory has been cleared"
  end
end

#===================================================== Screenshots definitions

Capybara::Screenshot.autosave_on_failure = false
Capybara::Screenshot.prune_strategy = :keep_last_run

# Methods and constant will be triggered in hooks.rb file
SCREENSHOT_DIR = "gen/screenshots_and_logs/"
def add_screenshot
  time = DateTime.now.strftime('%s')
  file_path = SCREENSHOT_DIR + "screenshot-#{time}.png"
  page.save_screenshot(file_path)
end

def clear_screenshot_dir
  if File.exists?(SCREENSHOT_DIR)
    FileUtils.rm_rf(SCREENSHOT_DIR)
    p "Screenshot directory has been cleared"
  end
end

#===================================================== Email notifications
# SMTP parameters for establishing connection with Google smtp server
def get_smtp_parameters
  smtp = {
      address: 'smtp.gmail.com',
      port: 587,
      domain: 'moovweb.com',
      user_name: 'eugene.shapovalov@moovweb.com',
      password: ENV['email_password'],
      authentication: 'plain',
      enable_starttls_auto: true
  }
end
Mail.defaults {delivery_method :smtp, get_smtp_parameters}

# This method will add necessary information to html template
def get_html_template(passed, failed, env, view_build_link, view_allure_link)
  file = File.read('features/data/email_template.html')
  email_template = Nokogiri::HTML.fragment(file)
  email_template.at_css('#passed').content += passed.to_s
  email_template.at_css('#failed').content += failed.to_s
  email_template.at_css('#env').content += env
  email_template.at_css("#circleci")['href'] = view_build_link
  email_template.at_css("#allure")['href'] = view_allure_link
  email_template.to_html
end

# Current host for broadcast is eugene.shapovalov@moovweb.com
def send_email_message(recipient, subject_str, body_html)
  mail = Mail.new do
    from 'eugene.shapovalov@moovweb.com'
    to recipient
    subject subject_str
    html_part do
      content_type 'text/html; charset=UTF-8'
      body body_html
    end
  end
  mail.deliver!
  p "Message delivered to: #{recipient}"
end

#Method for generating unique link for allure report
def get_allure_build_link
  begin
    return "https://" + ENV['CIRCLE_BUILD_NUM'] + "-165707333-gh.circle-artifacts.com/0/home/circleci/mw-automation-framework/gen/allure_html/index.html"
  rescue Exception
    p "CIRCLE_BUILD_NUM variable does not exist"
    return "Http link error"
  end
end