class Slate::Comment < ActiveRecord::Base
  belongs_to :post

  attr_accessible :body, :author_email, :author_name
end