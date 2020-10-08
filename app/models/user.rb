# frozen_string_literal: true

# User
class User < ApplicationRecord
  include Clearance::User

  has_many :contacts, dependent: :restrict_with_error
  has_many :touchpoints, dependent: :restrict_with_error
  has_many :goals, dependent: :destroy
  has_many :visits, class_name: 'Ahoy::Visit'
  has_many :events, class_name: 'Ahoy::Event'
  has_many :blog_posts, dependent: :restrict_with_error

	validates :email, presence: true, uniqueness: { case_sensitive: false }

  enum onboarding: { start: 0, contacts: 1, touchpoints: 2, dashboard: 3, finish: 4 },
       _prefix: true

  scope :in_time_zone, ->(time_zones) { where(time_zone: time_zones) }

  before_save :set_free_trial_expires_at

  def contacts?
    contacts.any?
  end

  def goal
    return if goals.empty?

    goals.latest.first
  end

  def goal?
    !!goal
  end

  def admin?
    admins = %w[danelson@greatawait.com andrea@goforno.com danelson@nobeforeyes.com]

    admins.include?(email)
  end

  private

  def set_free_trial_expires_at
    self.free_trial_expires_at = Time.current + 30.days
  end
end
