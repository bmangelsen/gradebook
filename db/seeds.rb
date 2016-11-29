# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ben = Teacher.create!(name: "Ben", password: "password")
alex = ben.students.create!(name: "Alex", password: "password")
russell = alex.parents.create!(name: "Russell", password: "password")

Grade.create!(assignment_name: "US History", date: Date.new(2016,11,29), grade: "A", student_id: alex.id)
Grade.create!(assignment_name: "Calculus", date: Date.new(2016,11,29), grade: "B", student_id: alex.id)
Grade.create!(assignment_name: "Biology", date: Date.new(2016,11,29), grade: "C", student_id: alex.id)
