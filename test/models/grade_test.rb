require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  test "can create grade and relationship to student" do
    users(:alex).grades.create!(assignment_name: "Biology", date: Date.new(2016,11,29), grade: "A")
    assert_equal "Biology", users(:alex).grades.last.assignment_name
  end
end
