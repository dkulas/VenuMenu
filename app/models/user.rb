class User < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	has_reputation :votes, source: {reputation: :votes, of: :comments}, aggregated_by: :sum

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.twitter_handle = auth.info.nickname
			user.save
		end
	end

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
			user.twitter_handle = auth["info"]["nickname"]
		end
	end

	def index
		@user = current_user.id
	end
end
