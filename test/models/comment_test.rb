require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "can create comment" do
    assert Comment.create
  end
end
