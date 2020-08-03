# frozen_string_literal: true

# TouchpointPresenter
class TouchpointPresenter
	attr_reader :touchpoint

	def initialize(touchpoint)
		@touchpoint = touchpoint
	end

	def follow_up_on
		touchpoint.follow_up_on.strftime('%A, %B %e')
	end

	def created_at
		touchpoint.created_at.strftime('%A, %B %e at %l:%M %p')
	end

	def result_dropdown_options
		touchpoint.class.results.keys
	end
end
