class Slate::Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  attr_accessible :title, :body, :published
end