# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Goal, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:target) }
    it { is_expected.to validate_numericality_of(:target).only_integer.is_greater_than(0) }
  end
end
