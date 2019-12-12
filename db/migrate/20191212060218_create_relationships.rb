class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :home_owner_id
      t.integer :sitter_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
