require 'spec_helper'

describe Slate::Blog do
  before :each do
    @blog = create(:blog)
  end

  describe ".first" do
    it "exists" do
      expect(@blog).to eq(Slate::Blog.first)
    end
    #it "should not create blog without title" do
    #  @blog.title = ""
    #  (@blog.save).should false
    #end
  end
end