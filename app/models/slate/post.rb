class Slate::Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author, :class_name => Slate.user_class

  attr_accessible :title, :body, :published, :author_id

  before_save :set_author
  before_save :set_body

  private
  def set_author
    self.author = Slate.user_class.constantize.find(self.author_id)
  end

  private
  def set_body
    MarkdownParser.new(:body)
  end
end