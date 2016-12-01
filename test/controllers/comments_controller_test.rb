require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "can get new comment view" do
    new_session(:ben)
    get new_comment_path(commentable_type: users(:alex).class, commentable_id: users(:alex).id)
    assert_select "h4", "Enter the info for your new comment!"
  end

  test "can create comment" do
    new_session(:ben)
    post comments_path(commentable_type: users(:alex).class, commentable_id: users(:alex).id),
      params: { comment: { body: "it works"}}
    assert_equal "it works", Comment.last.body
  end

  test "can delete comment" do
    new_session(:ben)
    post comments_path(commentable_type: users(:alex).class, commentable_id: users(:alex).id),
      params: { comment: { body: "it works"}}
    delete comments_path(commentable_type: users(:alex).class, commentable_id: users(:alex).id)
    assert_equal 0, Comment.count
  end
end
