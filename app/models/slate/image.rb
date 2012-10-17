class Slate::Image < ActiveRecord::Base
  belongs_to :post

  attr_accessible :image_uid, :thumb_uid, :post_id

  image_accessor :image do
    copy_to(:thumb){|a| a.thumb('312x355#') }
  end
  image_accessor :thumb
end