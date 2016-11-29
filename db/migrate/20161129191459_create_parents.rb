class CreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do |t|
      t.string :name
      t.integer :student_id

      t.timestamps
    end
  end
end
