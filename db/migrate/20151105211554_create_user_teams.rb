class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|
      
      t.timestamps null: false
    end
  end
end
