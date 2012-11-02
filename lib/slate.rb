require "slate/engine"
require "devise"
require "cancan"
require "haml"
require "jquery-rails"
require "kramdown"
require "will_paginate"
require "will_paginate-bootstrap"
require "acts-as-taggable-on"
require "slate/MarkdownParser"
require "rakismet"

module Slate
  mattr_accessor :user_class
end
