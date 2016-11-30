require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "can get create student view" do
    new_session(:ben)
    get new_student_path
    assert_select "h4", "Enter the info for your new student!"
  end

  test "can get students index" do
    new_session(:ben)
    get students_path
    assert_select "h4", "Here are all the students:"
  end

  test "can get show student view" do
    new_session(:alex)
    get student_path(users(:alex).id)
    assert_select "p", "You've logged in as Alex. What would you like to do today?"
  end

  test "can create new student" do
    new_session(:ben)
    post students_path, params: { student: { name: "Bob", teacher_id: users(:ben).id} }
    assert_equal "Bob", Student.last.name
  end

  test "redirects to new student view when student does not save" do
    new_session(:ben)
    post students_path, params: { student: {name: "Bob"} }
    assert_select "h4", "Enter the info for your new student!"
  end

  test "display redirection message when attempting to access unauthorized thing" do
    new_session(:alex)
    get new_student_path
    assert_select "a", "redirected"
  end
end
