class Slate::Blog < ActiveRecord::Base
  belongs_to :author, :class_name => Slate.user_class

  attr_accessible :title, :author_id, :logo, :background, :retained_logo, :retained_background

  image_accessor :logo do
    after_assign{|a| a.process!(:thumb, '200x200#') }
  end
  image_accessor :background do
    after_assign{|a| a.process!(:thumb, '1200x>') }
  end
  #before_save :set_author

  private
  def set_author
    self.author = Slate.user_class.constantize.find_or_create_by_name(author_name)
  end
end