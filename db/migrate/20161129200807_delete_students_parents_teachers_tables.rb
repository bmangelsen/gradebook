class DeleteStudentsParentsTeachersTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :students
    drop_table :parents
    drop_table :teachers
  end
end
