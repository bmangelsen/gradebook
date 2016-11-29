class AddIdsToUsersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :teacher_id, :integer
    add_column :users, :student_id, :integer
    add_column :users, :parent_id, :integer
  end
end
