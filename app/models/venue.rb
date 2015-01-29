class Venue < ActiveRecord::Base
	has_many :votes, through: :users
	has_many :comments, through: :users

end
