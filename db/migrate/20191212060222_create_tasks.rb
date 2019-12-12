class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :finished
      t.date :deadline
      t.integer :relationship_id

      t.timestamps
    end
  end
end
