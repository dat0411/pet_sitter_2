class AddSitterStatCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sitter_stat_count, :integer
  end
end
