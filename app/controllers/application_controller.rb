class ApplicationController < ActionController::Base
	protected

	def current_user
		User.first
	end
end
