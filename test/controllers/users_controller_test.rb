require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "can get edit user view" do
    new_session(:ben)
    get edit_user_path(users(:ben).id)
    assert_select "h4", "Change your password!"
  end
  test "can update teacher password" do
    new_session(:ben)
    patch user_path(users(:ben).id), params: { teacher: {password: "woop"} }
    delete session_path(users(:ben).id)
    post session_path, params: { name: users(:ben).name, password: "woop" }
    assert_equal (users(:ben).id), session["current_user_id"]
  end

  test "can update student password" do
    new_session(:alex)
    patch user_path(users(:alex).id), params: { student: {password: "woop"} }
    delete session_path(users(:alex).id)
    post session_path, params: { name: users(:alex).name, password: "woop" }
    assert_equal (users(:alex).id), session["current_user_id"]
  end

  test "can update parent password" do
    new_session(:russell)
    patch user_path(users(:russell).id), params: { parent: {password: "woop"} }
    delete session_path(users(:russell).id)
    post session_path, params: { name: users(:russell).name, password: "woop" }
    assert_equal (users(:russell).id), session["current_user_id"]
  end

  test "empty field message shows when password edit field is emtpy" do
    new_session(:ben)
    patch user_path(users(:ben).id), params: { teacher: {password: ""} }
    assert_select "div", "You left a field blank!"
  end
end
