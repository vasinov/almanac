require 'spec_helper'

describe Slate::Blog do
  it "should be possible to create a valid blog" do
    expect(create(:blog)).to eq(Slate::Blog.first)
  end

  it "should not be possible to create a blog without a title" do
    build(:blog, title: "").should_not be_valid
  end

  it "should not be possible to create more than one blog" do
    create(:blog)
    expect { create(:blog) }.to raise_error
  end
end