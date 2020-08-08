# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:contacts).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:touchpoints).dependent(:restrict_with_error) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    subject { create(:user) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  context 'instance methods' do
    context '#contacts?'
  end
end
