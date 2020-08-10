# frozen_string_literal: true

# DashboardPresenter displays data for the current week.
class DashboardPresenter
	CONTACTS_VIEW_LIMIT = 5

	attr_reader :user

	def initialize(user)
		@user = user
	end

	def num_noes
		touchpoints.no.this_week.size
	end

	def num_noes_needed
		num_touchpoints_for_one_yes * goal
	end

	def progress
		num_noes / num_noes_needed.to_f
	end

	def num_touchpoints_today
		touchpoints.today.size
	end

	def num_touchpoints_this_week
		touchpoints.this_week.size
	end

	def untouched_contacts
		@untouched_contacts ||= user.contacts.by_name.untouched.take(CONTACTS_VIEW_LIMIT)
	end

	def follow_up_contacts_today
		@follow_up_contacts_today ||=
		  user.
			  touchpoints.
				follow_up_today.
				select(&:follow_up?).
				map(&:contact).
				take(CONTACTS_VIEW_LIMIT)
	end

	def overdue_contacts
		user.contacts.by_name.overdue.take(CONTACTS_VIEW_LIMIT)
	end

	private

  # TODO: we need to ask (then store) the user about their conversion ratio: how
	#   many noes does it take to get one yes?
	def num_touchpoints_for_one_yes
		25
	end

	def goal
		user.active_goal.target
	end

	def touchpoints
		user.touchpoints
	end
end
