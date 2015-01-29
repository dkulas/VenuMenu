class AddVenueNameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :venue_name, :string
  end
end
