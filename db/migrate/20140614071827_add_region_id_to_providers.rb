class AddRegionIdToProviders < ActiveRecord::Migration
  def up
    add_column :providers, :region_id, :integer
  end

  def down
    remove_column :providers, :region_id
  end
end
