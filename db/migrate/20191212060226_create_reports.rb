class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.integer :relationship_id

      t.timestamps
    end
  end
end
