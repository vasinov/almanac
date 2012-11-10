class Slate::Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author, :class_name => Slate.user_class
  has_many :images, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  attr_accessible :title, :body, :published, :excerpt, :author_id, :blog_id, :tag_list, :written_at

  validates_presence_of :blog_id
  validates_presence_of :written_at
  validates_presence_of :author_id
  validates_presence_of :title, :if => lambda {|_| _.published }
  validates_presence_of :body, :if => lambda {|_| _.published }


  before_save :author=
  after_initialize :set_written_at

  acts_as_taggable

  self.per_page = 10

  default_scope order('written_at DESC')

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

  def author=
    @author = Slate.user_class.constantize.find(self.author_id)
  end
end