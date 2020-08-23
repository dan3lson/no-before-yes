# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:contacts).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:touchpoints).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:goals).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    subject { create(:user) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'instance methods' do
    describe '#contacts?'
    describe '#goal'
    describe '#goal?'
    describe '#free_trial_expires_at'
  end
end
