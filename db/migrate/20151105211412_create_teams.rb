class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :description

      t.references :user_teams

      t.timestamps null: false
    end
  end
end
