# frozen_string_literal: true

# Enqueues the UserMailer#monday_prep email to all users.
class MondayPrepJob
	queue_as :normal

	def perform
    users.each do |user|
			UserMailer.with(user: user).monday_prep.deliver_later
		end
	end

	private

	def users
		User.all
	end
end
