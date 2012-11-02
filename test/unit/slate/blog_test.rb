require "test_helper"

class BlogTest < ActiveSupport::TestCase
  def setup
    @blog = create(:blog)
  end

  # title validations
  test "should not create blog without title" do
    @blog.title = ""
    assert !@blog.save , "Created the blog without a title"
  end
end
