# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    subject { create(:contact) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
