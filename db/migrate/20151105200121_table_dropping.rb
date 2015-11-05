class TableDropping < ActiveRecord::Migration
  def change
    drop_table :users_teams
    drop_table :users_todos
    drop_table :teams_todos
  end
end
