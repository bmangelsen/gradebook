class Student < User
  belongs_to :teacher
  has_many :grades
  has_many :parents
end
