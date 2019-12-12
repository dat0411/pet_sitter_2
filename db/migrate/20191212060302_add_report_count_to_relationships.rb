class AddReportCountToRelationships < ActiveRecord::Migration[5.1]
  def change
    add_column :relationships, :reports_count, :integer
  end
end
