# frozen_string_literal: true

# Touchpoint
class Touchpoint < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :recap, presence: true
  validates :follow_up_on, presence: true
  validates :source, presence: true
  validates :result, presence: true

  enum source: { phone: 0, email: 1, in_person: 2 }
  enum result: { unknown: 0, no: 1, yes: 2 }

  scope :today, -> {
    where(created_at: Time.current.beginning_of_day..Time.current.end_of_day)
  }
  scope :latest, -> { order(created_at: :desc) }
  scope :yesterday, -> {
    where(created_at: DateTime.current.beginning_of_day - 1.day..DateTime.current.end_of_day - 1.day )
  }
  scope :this_week, -> { where(created_at: Time.current.beginning_of_week..Time.current.end_of_week) }
end
