class AddAssociationsToUsers < ActiveRecord::Migration
  def change
    # Creates linking table for users and teams
    create_table :users_teams, id: false do |t|
      t.integer :team_id
      t.integer :user_id
    end

    # Creates linking table for users and todos
    create_table :users_todos, id: false do |t|
      t.integer :todo_id
      t.integer :user_id
    end

    # Creates linking table for todos and teams
    create_table :teams_todos, id: false do |t|
      t.integer :todo_id
      t.integer :team_id
    end

    # Creates indexes for linking table for users and teams
    add_index :users_teams, :team_id
    add_index :users_teams, :user_id

    # Creates indexes for linking table for users and todos
    add_index :users_todos, :todo_id
    add_index :users_todos, :user_id

    # Creates indexes for linking table for todos and teams
    add_index :teams_todos, :todo_id
    add_index :teams_todos, :team_id
  end
end
