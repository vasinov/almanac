class Almanac::Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author, :class_name => Almanac.user_class
  has_many :images, :dependent => :destroy

  validates_presence_of :blog_id
  validates_presence_of :written_at
  validates_presence_of :author_id
  validates_presence_of :title, :if => lambda {|_| _.published }
  validates_presence_of :slug, :if => lambda {|_| _.published }
  validates_uniqueness_of :slug
  validates_presence_of :body, :if => lambda {|_| _.published }

  before_save :author=
  after_initialize :set_written_at
  after_initialize :check_slug

  acts_as_taggable

  self.per_page = 10

  default_scope order('written_at DESC, id DESC')

  def self.recent(params)
    self.where(:published => true).paginate(:page => posts_page(params), :per_page => posts_limit(params))
  end

  def self.drafts(params)
    self.where(:published => false)
  end

  def self.tagged(params)
    self.where(:published => true).tagged_with(params[:tag_name]).paginate(:page => posts_page(params), :per_page => posts_limit(params))
  end

  private
  def self.posts_limit(params)
    (params[:limit].blank?) ? self.per_page : params[:limit]
  end

  private
  def self.posts_page(params)
    (params[:page].blank?) ? 1 : params[:page]
  end

  private
  def set_written_at
    self.written_at ||= Date.today if new_record?
  end

  private
  def check_slug
    if self.published
      self.slug ||= self.id
    end
  end

  def author=
    @author = Almanac.user_class.constantize.find(self.author_id)
  end
end