# frozen_string_literal: true

# DashboardPresenter displays data for the current week.
class DashboardPresenter
	attr_reader :user

	def initialize(user)
		@user = user
	end

	def num_noes
		touchpoints.no.size
	end

	def num_noes_needed
		num_touchpoints_for_one_yes * goal
	end

	def progress
		num_noes / num_noes_needed.to_f
	end

	private

  # TODO: we need to ask (then store) the user about their conversion ratio: how
	#   many noes does it take to get one yes?
	def num_touchpoints_for_one_yes
		50
	end

	# TODO: replace with the (stored) user's weekly goal
	def goal
		1
	end

	def touchpoints
		user.touchpoints
	end
end
