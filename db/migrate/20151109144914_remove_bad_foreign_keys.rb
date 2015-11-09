class RemoveBadForeignKeys < ActiveRecord::Migration
  def change
    remove_column :users, :user_teams_id
    remove_column :teams, :user_teams_id

    remove_column :todo_assignments, :todo_type
    # remove_index :todo_assignments, name: "index_todo_assignments_on_todo_type_and_todo_id"

    remove_column :todos, :todo_assignment_id
    remove_column :todos, :todo_assignment_type
    # remove_index :todos, name: "index_todos_on_todo_assignment_type_and_todo_assignment_id"
  end
end
