require "almanac/engine"
require "devise"
require "cancan"
require "haml"
require "jquery-rails"
require "kramdown"
require "will_paginate"
require "will_paginate-bootstrap"
require "acts-as-taggable-on"
require "almanac/MarkdownParser"
require "bootstrap-rails-engine"

module Almanac
  mattr_accessor :user_class
end
