require 'true_automation/rspec'
require 'true_automation/driver/capybara'
# frozen_string_literal: true

require 'bundler/setup'
require 'rspec/its'

begin
  require 'coveralls'
  Coveralls.wear! do
    add_filter "spec/"
    add_filter "vendor/"
  end
rescue LoadError
  warn "warning: coveralls gem not found; skipping Coveralls"
  require 'simplecov'
  SimpleCov.start do
    add_filter "spec/"
    add_filter "vendor/"
  end
end

RSpec.configure do |config|
	config.include TrueAutomation::DSL

  Capybara.register_driver :true_automation_driver do |app|
    TrueAutomation::Driver::Capybara.new(app)
  end


    Capybara.configure do |capybara|
    end
    
	capybara.default_driver = :true_automation_driver
	capybara.run_server = false
  config.warnings = true
  config.filter_run_when_matching :focus
end
