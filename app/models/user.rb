# frozen_string_literal: true

# User
class User < ApplicationRecord
  include Clearance::User

  has_many :contacts, dependent: :restrict_with_error
  has_many :touchpoints, dependent: :restrict_with_error
  has_many :goals, dependent: :destroy

	validates :email, presence: true, uniqueness: { case_sensitive: false }

  def contacts?
    contacts.any?
  end
end
