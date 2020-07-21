class ApplicationController < ActionController::Base
	protected

	def current_user
		@current_user ||= User.first
	end
end
