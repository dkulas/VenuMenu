VenuMenu App

CORE Function
	- Rate and comment on specific venues

MVP
	- A user can login w/Twitter or use the app w/out signing in but cannot create watchlists
	- A user can search venues
	- A user can comment and rate on venues

Models

Users
	- ID
	- Name
	- Profile Pic

	has_many :votes
	has_many :comments

Venue
	- ID
	- Songkick_venue_id

	has_many :votes through :users
	has_many :comments through :users

Comments 
	 - ID
	 - User_id
	 - Venue_id

	 belonds_to :user

Votes
	- ID
	- User_id
	- Venue_id
	- Upvotes
	- Downvotes

	belongs_to :user

