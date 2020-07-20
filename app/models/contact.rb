# frozen_string_literal: true

# Contact
class Contact < ApplicationRecord
  belongs_to :user
  has_many :touchpoints, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
