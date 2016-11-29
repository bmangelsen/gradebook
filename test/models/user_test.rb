require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can create teacher user" do
    Teacher.create!(name: "Joe", password: "password")
    assert_equal "Joe", Teacher.last.name
  end

  test "can create student user and relationship to teacher" do
    users(:ben).students.create!(name: "Joe", password: "password")
    assert_equal "Joe", users(:ben).students.last.name
  end

  test "can create parent user and relationship to student" do
    users(:alex).parents.create!(name: "Joe", password: "password")
    assert_equal "Joe", users(:alex).parents.last.name
  end
end
