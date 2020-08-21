class ApplicationController < ActionController::Base
  include Clearance::Controller

  before_action :require_login
	around_action :set_time_zone, if: :current_user

  after_action :track_action

  protected

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end

	private

	def set_time_zone
		Time.use_zone(current_user.time_zone) { yield }
	end
end
