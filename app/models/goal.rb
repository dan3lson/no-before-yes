# frozen_string_literal: true

# Goal
class Goal < ApplicationRecord
  belongs_to :user

  validates :target,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  after_validation :report_validation_errors_to_rollbar            

  scope :latest, -> { order(created_at: :desc) }
end
