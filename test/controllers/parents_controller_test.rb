require 'test_helper'

class ParentsControllerTest < ActionDispatch::IntegrationTest
  test "can get create parent view" do
    new_session(:ben)
    get new_parent_path
    assert_select "h4", "Enter the info for your new parent!"
  end

  test "can get parents index" do
    new_session(:ben)
    get parents_path
    assert_select "h4", "Here are all the parents:"
  end

  test "can get show parent view" do
    new_session(:russell)
    get parent_path(users(:russell).id)
    assert_select "p", "You've logged in as Russell. What would you like to do today?"
  end

  test "can create new parent" do
    new_session(:ben)
    post parents_path, params: { parent: { name: "Bob", student_id: users(:alex).id} }
    assert_equal "Bob", Parent.last.name
  end

  test "redirects to new parent view when parent does not save" do
    new_session(:ben)
    post parents_path, params: { parent: { name: "Bob" } }
    assert_select "h4", "Enter the info for your new parent!"
  end
end
