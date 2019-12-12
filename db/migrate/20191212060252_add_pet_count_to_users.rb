class AddPetCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pets_count, :integer
  end
end
