# frozen_string_literal: true

# UserMailer sends general emails to users.
class UserMailer < ApplicationMailer
	def welcome
		@user = params[:user]

		mail to: @user.email, subject: 'Thanks for signing up'
	end
end
