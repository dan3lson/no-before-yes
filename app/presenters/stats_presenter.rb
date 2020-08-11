# frozen_string_literal: true

# StatPresenter displays all-time aggregate data and trends for a user.
class StatsPresenter
	attr_reader :user

	def initialize(user)
		@user = user
	end

	def contact_size
		contacts.size
	end

	def untouched_size
		contacts.untouched.size
	end

	def overdue_size
		contacts.overdue.size
	end

	def touchpoint_size
		touchpoints.size
	end

	def no_size
		touchpoints.no.size
	end

	def yes_size
		touchpoints.yes.size
	end

	def unknown_size
		touchpoints.unknown.size
	end

	def noes_needed_for_one_yes
		return no_size if yes_size.zero?

		no_size / yes_size
	end

	private

	def contacts
		user.contacts
	end

	def touchpoints
		user.touchpoints
	end
end
