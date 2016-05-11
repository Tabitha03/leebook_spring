class ActivitiesController <ApplicationController
	
	before_action :authenticate_user!, only: [:index]

	def index
		@users = current_user.active_friends@users).order
		@user << (current_user)
		@activities = PublicActivity::Activity.where(owner_id: 'created_at DESC') 

	end
end