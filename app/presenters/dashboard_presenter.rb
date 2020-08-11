# frozen_string_literal: true

# DashboardPresenter displays data for the current week.
class DashboardPresenter
  CONTACTS_VIEW_LIMIT = 5

  attr_reader :user

  def initialize(user)
    @user = user
  end

	def no_goal
		return 0 unless user.goal?

		user.goal.target
	end

  def progress
		return if no_goal.zero?

		num_noes_this_week / no_goal.to_f
  end

  def num_touchpoints_today
    touchpoints.today.size
  end

  def num_touchpoints_this_week
    touchpoints.this_week.size
  end

  def untouched_contacts
    @untouched_contacts ||= user.contacts.by_name.untouched.take(CONTACTS_VIEW_LIMIT)
  end

  def follow_up_contacts_today
    @follow_up_contacts_today ||=
      user.
        touchpoints.
        follow_up_today.
        select(&:follow_up?).
        map(&:contact).
        take(CONTACTS_VIEW_LIMIT)
  end

  def overdue_contacts
    user.contacts.by_name.overdue.take(CONTACTS_VIEW_LIMIT)
  end

  private

	def num_noes_this_week
		touchpoints.this_week.no.size
	end

  def touchpoints
    user.touchpoints
  end
end
