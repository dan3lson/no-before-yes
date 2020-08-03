# frozen_string_literal: true

module ApplicationHelper
	def today
		format_date(Time.current)
	end

	def format_date(date)
		date.strftime("%A, %B #{date.day.ordinalize}")
	end

	def active_link?(controller_name)
		return unless request.path.include?(controller_name.to_s)

		'active'
	end
end
