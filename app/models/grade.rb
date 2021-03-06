class Grade < ApplicationRecord
  belongs_to :student
  validates :assignment_name, presence: true
  validates :date, presence: true
  validates :grade, presence: true
  validates :student_id, presence: true
end
