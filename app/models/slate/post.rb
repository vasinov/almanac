class Slate::Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author, :class_name => Slate.user_class

  attr_accessible :title, :body, :published, :excerpt, :author_id

  before_save :set_author

  private
  def set_author
    self.author = Slate.user_class.constantize.find(self.author_id)
  end
end