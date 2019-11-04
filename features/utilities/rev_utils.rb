require 'yaml'


REV_HEADER_ELEMENTS = YAML.load_file(File.join(__dir__, '../data/REV_test_data/REV_header_elements.yaml'))
REV_TEST_DATA_LINKS = YAML.load_file(File.join(__dir__, '../data/REV_test_data_links.yaml'))

def rev_get_header_elements
  REV_HEADER_ELEMENTS['header_elements']
end

def rev_get_plp_link
  REV_TEST_DATA_LINKS['links']['clothing_plp_link']
end