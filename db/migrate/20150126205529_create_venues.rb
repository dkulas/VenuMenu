class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :songkick_venue_id

      t.timestamps null: false
    end
  end
end
