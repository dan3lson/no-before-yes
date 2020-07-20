# frozen_string_literal: true

# Touchpoint
class Touchpoint < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  validates :recap, presence: true
  validates :follow_up_on, presence: true
  validates :source, presence: true
  validates :result, presence: true

  enum source: { phone: 0, email: 1, in_person: 2 }
  enum result: { no: 0, yes: 1 }
end
