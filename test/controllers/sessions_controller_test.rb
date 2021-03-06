require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "can get new session view" do
    get root_path
    assert_select "h4", "Log in to the Gradebook"
  end

  test "can create new session" do
    new_session(:ben)
    assert_equal users(:ben).id, session["current_user_id"]
  end

  test "can terminate session" do
    new_session(:ben)
    delete session_path(users(:ben).id)
    assert_equal nil, session["current_user_id"]
  end

  test "error message shows when incorrect login" do
    post session_path, params: { name: users(:ben).name, password: "zoinks" }
    assert_select "div", "Wrong password/username combo!"
  end

  test "can get edit user password view when user attempts to log in for first time" do
    new_session(:ben)
    post teachers_path, params: { teacher: { name: "Bob"} }
    delete session_path(users(:ben).id)
    post session_path, params: { name: Teacher.last.name }
    assert_select "h4", "Change your password!"
  end
end
