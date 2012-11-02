class Slate::Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author, :class_name => Slate.user_class
  has_many :images, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  attr_accessible :title, :body, :published, :excerpt, :author_id, :blog_id, :tag_list

  before_save :author=

  acts_as_taggable

  self.per_page = 10

  default_scope order('id DESC')

  def self.recent(params)
    self.where(:published => true).paginate(:page => posts_page(params), :per_page => posts_limit(params))
  end

  def self.drafts(params)
    self.where(:published => false)
  end

  def self.tagged(params)
    self.where(:published => true).tagged_with(params[:tag_name]).paginate(:page => posts_page(params), :per_page => posts_limit(params))
  end

  def self.posts_limit(params)
    (params[:limit].blank?) ? 30 : params[:limit]
  end

  def self.posts_page(params)
    (params[:page].blank?) ? 1 : params[:page]
  end

  def author=
    @author = Slate.user_class.constantize.find(self.author_id)
  end
end