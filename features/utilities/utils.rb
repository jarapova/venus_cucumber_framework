require 'yaml'

USERS = YAML.load_file(File.join(__dir__, '../data/users.yaml'))
TEST_ENVIRONMENTS = YAML.load_file(File.join(__dir__, '../data/test_environments.yaml'))
EMAILS = YAML.load_file(File.join(__dir__, '../data/email_broadcast.yaml'))

def get_user(id)
  USERS['users'][id]
end

def set_page_timeout(seconds)
  page.driver.browser.manage.timeouts.page_load = seconds
end

def get_test_environments_url(site, version)
  TEST_ENVIRONMENTS[site][version]
end

def get_emails
  EMAILS['emails']
end
def m_ta(ta_locator, initial_locator)
  if true#ENV['ta_enabled']
    ta(ta_locator, initial_locator)
  else
    initial_locator
  end
end