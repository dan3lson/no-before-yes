class ApplicationController < ActionController::Base
	protected

	def current_user
		@current_user ||= User.find_by(email: 'danelson@greatawait.com')
	end
end
