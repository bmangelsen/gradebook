class Parent < User
  belongs_to :student
  validates :student_id, presence: true
end
