require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest
  test "can get create grade view" do
    new_session(:ben)
    get new_grade_path
    assert_select "h4", "Enter the info for your new grade!"
  end

  test "can get grades index" do
    new_session(:ben)
    get grades_path
    assert_select "h4", "Here are all the grades:"
  end

  test "can get edit grade view" do
    new_session(:ben)
    get edit_grade_path(grades(:history).id)
    assert_select "h4", "Edit the info for this grade!"
  end

  test "can create new grade" do
    new_session(:ben)
    post grades_path, params: { grade: { assignment_name: "Math", date: Date.new(2016,11,30), grade: "A", student_id: users(:alex).id} }
    assert_equal "Math", User.find_by(id: users(:alex).id).grades.last.assignment_name
  end

  test "redirects to new grade view when grade does not save" do
    new_session(:ben)
    post grades_path, params: { grade: { assignment_name: "Math", date: Date.new(2016,11,30), grade: "A"} }
    assert_select "h4", "Enter the info for your new grade!"
  end

  test "can edit grade" do
    new_session(:ben)
    patch grade_path(grades(:history).id), params: { grade: {grade: "B"} }
    assert_equal "B", Grade.find_by(id: grades(:history).id).grade
  end

  test "redirects to update grade view when grade does not update" do
    new_session(:ben)
    patch grade_path(grades(:history).id), params: { grade: { grade: "" } }
    assert_select "h4", "Edit the info for this grade!"
  end

  test "can delete grade" do
    new_session(:ben)
    delete grade_path(grades(:history).id)
    assert_equal 1, Grade.count
  end
end
