class UsersController < ApplicationController
	
	def index
		if current_user
			@user = current_user
		else
    	redirect_to new_user_path, notice: "Please log in"
  	end
	end

	def home
		render "home"
	end
end