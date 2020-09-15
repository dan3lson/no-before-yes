# frozen_string_literal: true

# Goal
class Goal < ApplicationRecord
  belongs_to :user

  validates :target,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }

  scope :latest, -> { order(created_at: :desc) }

  DEFAULT_TARGET = 5
end
