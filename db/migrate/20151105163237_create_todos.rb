class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name, null: false
      t.string :description
      t.datetime :date_created, :default => Time.now
      t.datetime :due_date
      t.boolean :done, :default => false
      t.integer :priority, :default => 2

      t.timestamps null: false
    end
  end
end
