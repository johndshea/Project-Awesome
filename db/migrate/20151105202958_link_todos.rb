class LinkTodos < ActiveRecord::Migration
  def change
    t.references :todo_assignment, polymorphic: true, index: true
  end
end
