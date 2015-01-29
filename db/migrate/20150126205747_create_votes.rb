class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :venue_id
      t.integer :upvote
      t.integer :downvote

      t.timestamps null: false
    end
  end
end
