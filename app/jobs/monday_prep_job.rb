# frozen_string_literal: true

# Enqueues the UserMailer#monday_prep email to all users.
class MondayPrepJob < ApplicationJob
	queue_as :default

	SEND_AT_HOUR = 21

	def perform
    users.each do |user|
			UserMailer.with(user: user).monday_prep.deliver_later
		end
	end

	private

	def time_zones_with_local_time(hour: SEND_AT_HOUR)
	  local_time = Time.zone.parse("#{Time.zone.now.hour}:00:00")

	  time_zones = ActiveSupport::TimeZone.all.select do |time_zone|
			time_zone.parse("#{hour}:00") == local_time
		end

		time_zones.map(&:name)
	end

	def users
		User.in_time_zone(time_zones_with_local_time)
	end
end
