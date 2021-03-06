# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "themes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "themes"
  s.version     = Themes::VERSION
  s.authors     = ["Ricard Forniol Agustí"]
  s.email       = ["ricard@forniol.cat"]
  s.homepage    = "http://github.com/ritxi/themes"
  s.summary     = "Simple theming gem for rails apps"
  s.description = "Add simple themes to rails applications"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]
  s.license = 'MIT'

  s.add_dependency "rails", ">= 3.2"
  s.add_dependency "zeitwerk"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "generator_spec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rspec-activemodel-mocks"
  s.add_development_dependency "fuubar"
  s.add_development_dependency "nyan-cat-formatter"
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'wwtd'

  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'appraisal'
end
