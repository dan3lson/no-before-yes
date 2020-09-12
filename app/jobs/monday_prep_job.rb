# frozen_string_literal: true

# Monday morning snapshot for what to expect in the new week.
class MondayPrepJob
	@queue = :normal

	def self.perform
    users.each do |user|
			UserMailer.with(user: user).monday_prep
		end
	end

	private

	def users
		[User.first]
		# User.all
	end
end
