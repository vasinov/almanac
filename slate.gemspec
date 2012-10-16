$:.push File.expand_path("../lib", __FILE__)
require "slate/version"

Gem::Specification.new do |s|
  s.name        = "slate"
  s.version     = Slate::VERSION
  s.authors     = ["Vasily Vasinov"]
  s.email       = ["vasinov@me.com"]
  s.homepage    = "http://www.vasinov.com"
  s.summary     = "The most elegant blog engine written in Rails."
  s.description = "TODO: Description of Slate."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "jquery-rails"
  s.add_dependency "haml"
  s.add_dependency "haml-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "devise"
  s.add_dependency "cancan"
  s.add_dependency "coffee-rails"
  s.add_dependency "uglifier"
  s.add_dependency "kramdown"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "factory_girl_rails"
end
