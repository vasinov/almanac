require 'spec_helper'

describe Slate::Blog do
  it "should be possible to create a valid blog" do
    expect(create(:blog)).to eq(Slate::Blog.first)
  end

  it "should not create blog without title" do
    build(:blog, title: "").should_not be_valid
  end

  it "should not create more than one blog" do
    create(:blog)
    expect { create(:blog) }.to raise_error
  end
end