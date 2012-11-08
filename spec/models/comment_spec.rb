require 'spec_helper'

describe Slate::Comment do
  it "should be possible to create a valid comment" do
    create(:comment)

    expect(Slate::Comment.all.count).to eq(1)
  end

  it "should not be possible to create a comment without an author_name" do
    build(:comment, author_name: "").should_not be_valid
  end

  it "should not be possible to create a comment without an author_email" do
    build(:comment, author_email: "").should_not be_valid
  end

  it "should not be possible to create a comment without an body" do
    build(:comment, body: "").should_not be_valid
  end

  it "should not be possible to create a comment without a post" do
    build(:comment, post: nil).should_not be_valid
  end

  describe ".spam" do
    it "should return spam comments" do
      comments_count = 10
      spam_comments_count = 5
      post = create(:post_with_comments, comments_count: comments_count)
      create_list(:spam_comment, spam_comments_count, post_id: post.id)
      expect(Slate::Comment.spam.count).to eq spam_comments_count
    end
  end
end