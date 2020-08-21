# frozen_string_literal: true

# SessionsController
class SessionsController < Clearance::SessionsController
	def create
		super
		ahoy.authenticate(@user)
	end
end
