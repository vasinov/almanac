class Slate::Image < ActiveRecord::Base
  belongs_to :post

  attr_accessible :image, :thumb, :post_id

  image_accessor :image do
    copy_to(:thumb){|a| a.thumb('100x100#') }
  end
  image_accessor :thumb
end