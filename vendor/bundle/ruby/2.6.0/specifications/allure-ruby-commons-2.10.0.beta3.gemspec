# -*- encoding: utf-8 -*-
# stub: allure-ruby-commons 2.10.0.beta3 ruby lib

Gem::Specification.new do |s|
  s.name = "allure-ruby-commons".freeze
  s.version = "2.10.0.beta3"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andrejs Cunskis".freeze]
  s.date = "2019-06-25"
  s.description = "Utilities allowing to implement allure result generation by other test frameworks".freeze
  s.email = "andrejs.cunskis@gmail.com".freeze
  s.homepage = "http://allure.qatools.ru".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Common library for allure results generation".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<uuid>.freeze, ["~> 2.3.9"])
      s.add_runtime_dependency(%q<require_all>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 1.8", "< 3"])
      s.add_runtime_dependency(%q<rubyzip>.freeze, ["~> 1.2"])
    else
      s.add_dependency(%q<uuid>.freeze, ["~> 2.3.9"])
      s.add_dependency(%q<require_all>.freeze, ["~> 2.0"])
      s.add_dependency(%q<json>.freeze, [">= 1.8", "< 3"])
      s.add_dependency(%q<rubyzip>.freeze, ["~> 1.2"])
    end
  else
    s.add_dependency(%q<uuid>.freeze, ["~> 2.3.9"])
    s.add_dependency(%q<require_all>.freeze, ["~> 2.0"])
    s.add_dependency(%q<json>.freeze, [">= 1.8", "< 3"])
    s.add_dependency(%q<rubyzip>.freeze, ["~> 1.2"])
  end
end
