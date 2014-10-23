# require 'dragonfly/rails/images'
require 'dragonfly'

app = Dragonfly.app(:dummy).configure do
  plugin :imagemagick
end
