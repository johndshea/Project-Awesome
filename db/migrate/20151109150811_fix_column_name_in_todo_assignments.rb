class FixColumnNameInTodoAssignments < ActiveRecord::Migration
  def change
    rename_column :todo_assignments, :user_type, :assignable_type
    rename_column :todo_assignments, :user_id, :assignable_id
  end
end
