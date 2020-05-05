class RelationshipsController < ApplicationController
	def create
		followed = current_user.follow(params[:user_id])
		redirect_back(fallback_location: root_path)
	end

	def destroy
		followed = current_user.unfollow(params[:user_id])
		redirect_back(fallback_location: root_path)
	end

end
