class Slate::Comment < ActiveRecord::Base
  include Rakismet::Model

  belongs_to :post

  attr_accessible :body, :author_email, :author_name

  validates_presence_of :author_name
  validates_presence_of :author_email
  validates_presence_of :post
  validates_presence_of :body

  rakismet_attrs :author => :author_name, :author_email => :author_email

  default_scope order('id ASC')

  def self.spam
    self.where(:spam => true)
  end
end