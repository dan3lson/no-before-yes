# frozen_string_literal: true

# User
class User < ApplicationRecord
	has_secure_password

  has_many :contacts, dependent: :destroy

	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, presence: true
end
