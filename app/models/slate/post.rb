class Slate::Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author, :class_name => Slate.user_class

  attr_accessible :title, :body, :published

  #before_save :set_author

  private
  def set_author
    self.author = Slate.user_class.constantize.find_or_create_by_name(author_name)
  end
end