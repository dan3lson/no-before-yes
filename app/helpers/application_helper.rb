# frozen_string_literal: true

module ApplicationHelper
	def today
		format_date(Time.current)
	end

	def format_date(date)
		date.strftime("%A, %B #{date.day.ordinalize}")
	end
end
