class Almanac::Image < ActiveRecord::Base
  extend Dragonfly::Model

  belongs_to :post

  dragonfly_accessor :image do
    copy_to(:thumb){|a| a.thumb('100x100#') }
  end
  dragonfly_accessor :thumb
end
