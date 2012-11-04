class Slate::Blog < ActiveRecord::Base
  belongs_to :author, :class_name => Slate.user_class

  attr_accessible :title, :description, :author_id, :logo, :background, :retained_logo,
                  :retained_background, :google_analytics, :twitter, :rakismet_key,
                  :rakismet_url

  image_accessor :logo do
    after_assign{|a| a.process!(:thumb, '200x200#').encode(:png) }
  end
  image_accessor :background do
    after_assign{|a| a.process!(:thumb, '1200x>').encode(:png) }
  end

  before_save :author=
  before_create :check_for_uniqueness

  validates_presence_of :title

  def author=
    @author = Slate.user_class.constantize.find(self.author_id)
  end

  private
  def check_for_uniqueness
    unless Slate::Blog.first == nil
      raise "You can only have one blog."
    end
  end
end