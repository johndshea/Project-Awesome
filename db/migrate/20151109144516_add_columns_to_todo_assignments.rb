class AddColumnsToTodoAssignments < ActiveRecord::Migration
  def change
    add_reference :todo_assignments, :user, polymorphic: true, index: true
    add_reference :todo_assignments, :todo, polymorphic: true, index: true
  end
end
