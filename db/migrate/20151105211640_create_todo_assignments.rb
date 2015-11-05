class CreateTodoAssignments < ActiveRecord::Migration
  def change
    create_table :todo_assignments do |t|

      t.timestamps null: false
    end
  end
end
