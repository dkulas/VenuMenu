class RemoveVenueIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :venue_id, :integer
  end
end
