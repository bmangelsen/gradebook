# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do
  Teacher.create(name: FFaker::Name.name, password: "password")
end

100.times do
  Student.create(name: FFaker::Name.name, password: "password", teacher_id: Teacher.all.sample.id)
end

200.times do
  Parent.create(name: FFaker::Name.name, password: "password", student_id: Student.all.sample.id)
end

500.times do
  Grade.create(assignment_name: ["History", "Calculus", "Biology"].sample, date: FFaker::Time.date, grade: ["A", "B", "C", "D", "F"].sample, student_id: Student.all.sample.id)
end
