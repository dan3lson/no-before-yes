# frozen_string_literal: true
class TouchpointPresenter
	attr_reader :touchpoint

	def initialize(touchpoint)
		@touchpoint = touchpoint
	end

	def follow_up_on
		touchpoint.follow_up_on.strftime('%a, %b %e')
	end

	def created_at
		touchpoint.created_at.strftime('%a, %b %e at %l:%M %p')
	end
end
