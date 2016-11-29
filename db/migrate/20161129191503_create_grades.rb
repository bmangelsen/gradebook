class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.string :assignment_name
      t.date :date
      t.string :grade
      t.integer :student_id

      t.timestamps
    end
  end
end
