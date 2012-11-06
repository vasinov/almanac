# require 'dragonfly/rails/images'
require 'dragonfly'

app = Dragonfly[:dummy]
app.configure_with(:imagemagick)
app.configure_with(:rails)
app.define_macro(ActiveRecord::Base, :image_accessor)