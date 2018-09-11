# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'api_auth/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'api_auth'
  s.version     = ApiAuth::VERSION
  s.authors     = ['wuyingchao']
  s.email       = ['wuyingchao1@gmail.com']
  s.homepage    = 'https://githbu.com/crosspass/api_auth'
  s.summary     = 'Api authorization and authentication'
  s.description = 'Rails app api authenticate and authorize'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'bootstrap'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'rails', '~> 5.1.4'
  
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'rails-pry'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
end
