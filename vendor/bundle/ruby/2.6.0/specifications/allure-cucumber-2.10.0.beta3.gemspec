# -*- encoding: utf-8 -*-
# stub: allure-cucumber 2.10.0.beta3 ruby lib

Gem::Specification.new do |s|
  s.name = "allure-cucumber".freeze
  s.version = "2.10.0.beta3"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrejs Cunskis".freeze]
  s.date = "2019-06-25"
  s.description = "Cucumber adaptor to generate rich allure test reports".freeze
  s.email = "andrejs.cunskis@gmail.com".freeze
  s.homepage = "http://allure.qatools.ru".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Allure cucumber ruby adaptor".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<allure-ruby-commons>.freeze, ["= 2.10.0.beta3"])
      s.add_runtime_dependency(%q<cucumber>.freeze, ["~> 3.1"])
    else
      s.add_dependency(%q<allure-ruby-commons>.freeze, ["= 2.10.0.beta3"])
      s.add_dependency(%q<cucumber>.freeze, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<allure-ruby-commons>.freeze, ["= 2.10.0.beta3"])
    s.add_dependency(%q<cucumber>.freeze, ["~> 3.1"])
  end
end
