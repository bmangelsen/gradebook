require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "can get create teacher view" do
    new_session(:ben)
    get new_teacher_path
    assert_select "h4", "Enter the info for your new teacher!"
  end

  test "can get teachers index" do
    new_session(:ben)
    get teachers_path
    assert_select "h4", "Here are all the teachers:"
  end

  test "can get show teacher view" do
    new_session(:ben)
    get teacher_path(users(:ben).id)
    assert_select "p", "You've logged in as Ben. What would you like to do today?"
  end

  test "can create new teacher" do
    new_session(:ben)
    post teachers_path, params: { teacher: { name: "Bob"} }
    assert_equal "Bob", Teacher.last.name
  end

  test "redirects to new teacher view when teacher does not save" do
    new_session(:ben)
    post teachers_path, params: { teacher: {name: ""} }
    assert_select "h4", "Enter the info for your new teacher!"
  end
end
