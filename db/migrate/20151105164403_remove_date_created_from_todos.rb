class RemoveDateCreatedFromTodos < ActiveRecord::Migration
  def change
    remove_column :todos, :date_created, :datetime
  end
end
