class Slate::Blog < ActiveRecord::Base
  belongs_to :author, :class_name => Slate.user_class

  attr_accessible :title, :author_id, :logo, :background

  image_accessor :logo
  image_accessor :background
  #before_save :set_author

  private
  def set_author
    self.author = Slate.user_class.constantize.find_or_create_by_name(author_name)
  end
end