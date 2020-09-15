# frozen_string_literal: true

class UserMailerPreview < ActionMailer::Preview
  def welcome
		UserMailer.with(user: User.first).welcome
  end

  def monday_prep
    UserMailer.with(user: User.first).monday_prep
  end
end
