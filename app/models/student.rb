class Student < User
  belongs_to :teacher
  has_many :grades
  has_many :parents
  validates :teacher_id, presence: true
end
