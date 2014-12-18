class SessionsController < ApplicationController
	def create
		#create a user new user using authentication information provided by omniauth's authentication hash
		user = User.from_omniauth(env["omniauth.auth"])
		#assign the user a session id based on his user id (to ensure it is unique)
		session[:user_id] = user.id
		# (redirect to home index)
		redirect_to root_url
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end