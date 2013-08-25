$:.push File.expand_path("../lib", __FILE__)
require "almanac/version"

Gem::Specification.new do |s|
  s.name        = "almanac"
  s.version     = Almanac::VERSION
  s.authors     = ["Vasily Vasinov"]
  s.email       = ["vasinov@me.com"]
  s.homepage    = "https://github.com/vasinov/almanac"
  s.summary     = "The most elegant blog engine for Rails apps."
  s.description = "Almanac is the most elegant mountable blog engine that can be easily hooked up in the existing Rails application."
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "therubyracer"
  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "jquery-rails"
  s.add_dependency "haml"
  s.add_dependency "haml-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "twitter-bootstrap-rails"
  s.add_dependency "devise"
  s.add_dependency "cancan"
  s.add_dependency "coffee-rails"
  s.add_dependency "uglifier"
  s.add_dependency "kramdown"
  s.add_dependency "rack-cache"
  s.add_dependency "dragonfly"
  s.add_dependency "mini_magick"
  s.add_dependency "will_paginate", '~> 3.0.3'
  s.add_dependency "will_paginate-bootstrap"
  s.add_dependency "acts-as-taggable-on", '~> 2.3.1'

  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "faker"
  s.add_development_dependency "factory_girl_rails"
end
