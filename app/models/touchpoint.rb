# frozen_string_literal: true

# Touchpoint
class Touchpoint < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :recap, presence: true
  validates :follow_up_on, presence: true
  validates :source, presence: true
  validates :result, presence: true
  after_validation :report_validation_errors_to_rollbar

  enum source: { phone: 0, email: 1, in_person: 2 }
  enum result: { unknown: 0, no: 1, yes: 2 }

  scope :latest, -> { order(created_at: :desc) }
  scope :today, -> {
    where(created_at: Time.current.beginning_of_day..Time.current.end_of_day)
  }
  scope :yesterday, -> {
    where(created_at: Time.current.beginning_of_day - 1.day..Time.current.end_of_day - 1.day )
  }
  scope :this_week, -> {
    where(created_at: Time.current.beginning_of_week..Time.current.end_of_week)
  }
  scope :follow_up_today, -> { where(follow_up_on: Date.today).order(:created_at) }
  scope :created_after, ->(touchpoint) { where(contact: touchpoint.contact).where('created_at > ?', touchpoint.created_at) }

  def follow_up?
    return false unless follow_up_on == Time.zone.today

    user.touchpoints.created_after(self).empty?
  end

  def overdue?
    Time.zone.today > follow_up_on && user.touchpoints.created_after(self).empty?
  end
end
