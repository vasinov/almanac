require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    post = create(:post)
  end

  # title validations
  test "should not publish post without title" do
    post.title = ""
    assert !post.save , "Published the post without a title"
  end

  test "should save post without title" do
    post.published = false
    post.title = ""
    assert post.save , "Didn't save the post without a title"
  end

  # body validations
  test "should not publish post without body" do
    post.body = ""
    assert !post.save , "Published the post without a title"
  end

  test "should save post without body" do
    post.published = false
    post.body = ""
    assert post.save , "Didn't save the post without a body"
  end
end
