class Slate::Comment < ActiveRecord::Base
  include Rakismet::Model

  belongs_to :post

  attr_accessible :body, :author_email, :author_name

  rakismet_attrs :author => :author_name, :author_email => :author_email

  default_scope order('id ASC')
end