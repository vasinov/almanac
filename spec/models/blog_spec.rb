require 'spec_helper'

describe Almanac::Blog do
  it "should be possible to create a valid blog" do
    expect(create(:blog)).to eq(Almanac::Blog.first)
  end

  it "should not be possible to create a blog without a title" do
    build(:blog, title: "").should_not be_valid
  end

  it "should not be possible to create more than one blog" do
    create(:blog)
    expect { create(:blog) }.to raise_error
  end
end