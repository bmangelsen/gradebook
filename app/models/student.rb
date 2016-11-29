class Student < ApplicationRecord
  has_many :grades
  has_many :parents
  belongs_to :teacher
  validates :name, presence: true
end
