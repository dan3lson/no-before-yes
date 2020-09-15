# frozen_string_literal: true

# UserMailer sends general emails to users.
class UserMailer < ApplicationMailer
	default template_path: "mailers/#{name.underscore}"

	def welcome
		@user = params[:user]

		mail to: @user.email, subject: 'Thanks for signing up'
	end

	def monday_prep
		@user = params[:user]

		mail to: @user.email, subject: 'Your week at a glance'
	end
end
