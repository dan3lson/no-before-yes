# frozen_string_literal: true

# Contact
class Contact < ApplicationRecord
  belongs_to :user
  has_many :touchpoints, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :by_name, -> { order(:name) }
  scope :untouched, -> { select { |contact| contact.touchpoints.empty? } }
  scope :follow_up_today, -> {
    joins(:touchpoints).
      merge(Touchpoint.follow_up_today).
      select { |contact| contact.follow_up_touchpoint.follow_up? }
  }

  def follow_up_touchpoint
    touchpoints.follow_up_today.last
  end
end
