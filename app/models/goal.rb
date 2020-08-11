# frozen_string_literal: true

# Goal
class Goal < ApplicationRecord
  belongs_to :user

  validates :target, presence: true, numericality: { greater_than: 0 }

  scope :latest, -> { order(created_at: :desc) }
end
