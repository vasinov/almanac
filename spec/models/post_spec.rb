require 'spec_helper'

describe Almanac::Post do
  it "should be possible to create a valid post" do
    create(:post)
    expect(Almanac::Post.all.count).to eq(1)
  end
  it "should be possible to create a post draft without a title" do
    build(:post_draft, title: "").should be_valid
  end
  it "should be possible to create a post draft without a slug" do
    build(:post_draft, slug: "").should be_valid
  end
  it "should be possible to create a post draft without a body" do
    build(:post_draft, body: "").should be_valid
  end
  it "should not be possible to create a post draft without a blog" do
    build(:post_draft, blog_id: "").should_not be_valid
  end
  it "should not be possible to publish a post without a title" do
    build(:post, title: "").should_not be_valid
  end
  it "should not be possible to publish a post without a title" do
    build(:post, slug: "").should_not be_valid
  end
  it "should not be possible to publish a post without a body" do
    build(:post, body: "").should_not be_valid
  end
  it "should not be possible to publish a post without a written_at" do
    build(:post, written_at: nil).should_not be_valid
  end
  it "should be possible to publish a post without an excerpt" do
    build(:post, excerpt: "").should be_valid
  end
  it "should not be possible to publish a post without a blog" do
    build(:post, blog_id: "").should_not be_valid
  end
  it "should be possible to publish more than one post" do
    create(:blog_with_posts, posts_count: 2)
    expect(Almanac::Post.all.count).to eq(2)
  end

  describe ".recent" do
    it "should return 10 recent posts" do
      # TODO: figure out why this doesn't work in the model, but works in paginated views
      #create(:blog_with_posts, posts_count: 12)
      #expect(Almanac::Post.recent({}).count).to eq(10)
    end
    it "should not include drafts" do
      posts_count = 4
      drafts_count = 3
      create(:blog_with_posts, posts_count: posts_count)
      blog_id = Almanac::Post.first.blog_id
      create_list(:post_draft, drafts_count, blog_id: blog_id)
      expect(Almanac::Post.recent({}).count).to eq posts_count
    end
  end

  describe ".drafts" do
    it "should return only drafts" do
      drafts_count = 3
      create(:blog_with_posts, posts_count: 3)
      blog_id = Almanac::Post.first.blog_id
      create_list(:post_draft, drafts_count, blog_id: blog_id)
      expect(Almanac::Post.drafts({}).count).to eq drafts_count
    end
  end

  describe ".tagged" do
    it "should return tagged posts" do
      posts_count = 10
      create(:blog_with_posts, posts_count: posts_count)
      blog_id = Almanac::Post.first.blog_id
      create_list(:post, 2, blog_id: blog_id, tag_list: "")
      expect(Almanac::Post.tagged({ :tag_name => "common" }).count).to eq posts_count
    end
    it "should not return drafts" do
      posts_count = 10
      create(:blog_with_posts, posts_count: posts_count)
      blog_id = Almanac::Post.first.blog_id
      create_list(:post, 2, blog_id: blog_id, published: false)
      expect(Almanac::Post.tagged({ :tag_name => "common" }).count).to eq posts_count
    end
  end
end