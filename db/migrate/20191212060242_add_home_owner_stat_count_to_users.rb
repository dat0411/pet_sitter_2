class AddHomeOwnerStatCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :home_owner_stat_count, :integer
  end
end
