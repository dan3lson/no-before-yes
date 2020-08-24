class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit

  before_action :require_login
	around_action :set_time_zone, if: :current_user
  after_action :track_action

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def track_action
    ahoy.track 'Ran action', request.path_parameters
  end

	private

	def set_time_zone
		Time.use_zone(current_user.time_zone) { yield }
	end

  def user_not_authorized
    flash[:danger] = 'Sorry, you are not authorized to do this.'

    redirect_to(request.referrer || root_path)
  end
end
