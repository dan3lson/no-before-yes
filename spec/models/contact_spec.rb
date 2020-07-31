# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:touchpoints).dependent(:restrict_with_error) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    subject { create(:contact) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'class methods' do
    describe '::untouched'
    describe '::follow_up_today'
  end

  describe 'instance_methods' do
    describe '#follow_up_touchpoint'
  end
end
