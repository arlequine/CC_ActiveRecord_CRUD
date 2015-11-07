class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      # Completa con las columnas que necesites
      t.string :name
      t.boolean :completed
      t.timestamps
    end

    add_index :tasks, :name
  end
end
