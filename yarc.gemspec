# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yarc/version"

Gem::Specification.new do |s|
  s.name        = "yarc"
  s.version     = Yarc::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["vladom"]
  s.email       = ["moravecvlad@gmail.com"]
  s.homepage    = "https://github.com/vladom/yarc"
  s.summary     = %q{Yet Another Ruby Cms for Sinatra}
  s.description = %q{Quick and easy setup of a web content}

  s.rubyforge_project = "yarc"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  #s.add_dependency 'sinatra', '= 1.1.0'
  s.add_dependency 'rack-cache'
  s.add_dependency 'erector', '>= 0.8.1'
  s.add_dependency 'datamapper', '~> 1.0.2'
  s.add_dependency 'dm-postgres-adapter', '~> 1.0.2'
  s.add_dependency 'dm-is-tree', '~> 1.0.2'
  s.add_dependency 'activesupport', '>=3.0'
  s.add_dependency 'i18n', '>=0.5.0'

  s.add_development_dependency 'rspec', '>= 2.4.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rack-test'
end
