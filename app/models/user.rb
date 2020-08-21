# frozen_string_literal: true

# User
class User < ApplicationRecord
  include Clearance::User

  has_many :contacts, dependent: :restrict_with_error
  has_many :touchpoints, dependent: :restrict_with_error
  has_many :goals, dependent: :destroy
  has_many :visits, class_name: 'Ahoy::Visit'
  has_many :events, class_name: 'Ahoy::Event'

	validates :email, presence: true, uniqueness: { case_sensitive: false }

  enum onboarding: { start: 0, contacts: 1, touchpoints: 2, dashboard: 3, finish: 4 },
       _prefix: true

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
end
