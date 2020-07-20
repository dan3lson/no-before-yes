# frozen_string_literal: true

# Contact
class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
