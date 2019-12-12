class AddTaskCountToRelationships < ActiveRecord::Migration[5.1]
  def change
    add_column :relationships, :tasks_count, :integer
  end
end
