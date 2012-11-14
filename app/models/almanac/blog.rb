class Almanac::Blog < ActiveRecord::Base
  belongs_to :author, :class_name => Almanac.user_class

  attr_accessible :title, :description, :author_id, :logo, :background, :retained_logo,
                  :retained_background, :google_analytics, :twitter, :rakismet_key,
                  :rakismet_url, :background_tile, :background_blur, :footer

  image_accessor :logo do
    after_assign{|a| a.process!(:thumb, '100x100#').encode(:png) }
  end
  image_accessor :background do
    after_assign{|a| a.process!(:thumb, '1200x>').encode(:png) }
  end

  before_save :author=
  before_create :check_for_uniqueness

  validates_presence_of :author_id
  validates_presence_of :title
  validates_inclusion_of :background_blur, :in => [0, 1, 2]

  def author=
    @author = Almanac.user_class.constantize.find(self.author_id)
  end

  private
  def check_for_uniqueness
    unless Almanac::Blog.first == nil
      raise "You can only have one blog."
    end
  end
end