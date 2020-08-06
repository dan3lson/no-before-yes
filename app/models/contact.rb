# frozen_string_literal: true

# Contact
class Contact < ApplicationRecord
  belongs_to :user
  has_many :touchpoints, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :by_name, -> { order(:name) }
  scope :untouched, -> { select { |contact| contact.touchpoints.empty? } }
  scope :overdue, -> { select { |contact| !contact.touchpoints.select(&:overdue?).empty? } }

  def follow_up_touchpoint
    touchpoints.follow_up_today.last
  end

  def overdue_touchpoint
    touchpoints.select(&:overdue?).last
  end
end
