# This hook is used for making screenshots for failed scenarios
# and also it will show whether test failed or passed for more
# efficient debugging
After do |scenario|

  #Method for cleaning cloud

  def delete_saved_elements
    port = URI.parse(Capybara.current_session.driver.options[:url]).port

    base_url = "http://localhost:#{port}"
    url = URI("#{base_url}/clear_elements")

    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Delete.new(url)
    response = http.request(request)

    if response.code == 200.to_s
      puts "All elements were deleted"
    else
      puts "Elements can not be deleted"
      puts response.body
    end
  end

  delete_saved_elements



  if scenario.failed?
    if ENV['screenshot_on_fail']
      path_to_screenshot = add_screenshot
      Allure.add_attachment(name: "screenshot on fail",
                            source: File.open(path_to_screenshot),
                            type: Allure::ContentType::PNG,
                            test_case: true)
      p "screenshot saved #{path_to_screenshot}"
    end
    FAILED_SCENARIOS += 1 if ENV['send_email']
  end
  if scenario.passed?
    p 'Passed'
    PASSED_SCENARIOS += 1 if ENV['send_email']
  end
end



# This hook is used for clearing screenshot directory
# and allure results directory
# New version of Allure 2.10.0.beta3 does not support this feature by default.
# In addition, this hook is analyzing environment variables for
# coordinating framework which feature to test
AfterConfiguration do
  clear_screenshot_dir
  clear_allure_directory if CLEAR_ALLURE_DIRECTORY
  PASSED_SCENARIOS = 0
  FAILED_SCENARIOS = 0
  if ENV['pwa']
    PWA = ENV['pwa']
  else
    PWA = 'venus'
  end

  if ENV['version']
    PWA_VERSION = ENV['version']
  else
    PWA_VERSION = 'prod'
  end
  BASE_URL = get_test_environments_url(PWA, PWA_VERSION)

  p "Testing site: #{PWA} version: #{PWA_VERSION} environment: #{BASE_URL}"
end

# This hook will create file to show
# environment properties in allure report
# and will add there necessary information.
# Also it will make email broadcast for
# emails specified in yaml file
at_exit do

  f = File.open('gen/allure-results/environment.properties', 'w')
  f.puts "PWA: #{PWA}"
  f.puts "Version: #{PWA_VERSION}" if ENV['version']
  f.puts "Base_URL: #{BASE_URL}"
  f.puts "Device emulation: iPhone X"
  f.close

  if ENV['send_email']
    env_info = "PWA: #{PWA} Version: #{PWA_VERSION} BASE_URL: #{BASE_URL} Branch: #{ENV['CIRCLE_BRANCH']}"

    html_message = get_html_template(PASSED_SCENARIOS,
                                     FAILED_SCENARIOS,
                                     env_info,
                                     ENV['CIRCLE_BUILD_URL'],
                                     get_allure_build_link)
    get_emails.each do |name, email|
      p "Sending to #{name}..."
      send_email_message(email, "Test automation notification", html_message)
    end
  end
end