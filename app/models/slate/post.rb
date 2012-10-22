class Slate::Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author, :class_name => Slate.user_class
  has_many :images

  attr_accessible :title, :body, :published, :excerpt, :author_id

  before_save :set_author

  def self.recent(params)
    self.where(:published => true).order('id DESC').page(posts_page(params)).per(posts_limit(params))
  end

  def self.drafts(params)
    self.where(:published => false).order('id DESC')
  end

  def self.posts_limit(params)
    (params[:limit].blank?) ? 30 : params[:limit]
  end

  def self.posts_page(params)
    (params[:page].blank?) ? 1 : params[:page]
  end

  private
  def set_author
    self.author = Slate.user_class.constantize.find(self.author_id)
  end
end