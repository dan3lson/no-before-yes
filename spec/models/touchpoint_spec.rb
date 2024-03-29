require 'rails_helper'

RSpec.describe Touchpoint, type: :model do
  context 'attributes' do
    it do
      should define_enum_for(:source).
        with_values(%i[phone email in_person]).
        backed_by_column_of_type(:integer)
    end
    it do
      should define_enum_for(:result).
        with_values(%i[unknown no yes]).
        backed_by_column_of_type(:integer)
    end
  end

  context 'associations' do
    it { is_expected.to belong_to(:contact) }
    it { is_expected.to belong_to(:user) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:recap) }
    it { is_expected.to validate_presence_of(:follow_up_on) }
    it { is_expected.to validate_presence_of(:source) }
    it { is_expected.to validate_presence_of(:result) }
  end

  context 'scopes' do
    describe '::today'
    describe '::yesterday'
    describe '::this_week'
    describe '::follow_up_today'
    describe '::created_after'
  end

  describe 'instance methods' do
    describe '#follow_up?' do
      context 'when :follow_up_on is not today'
      context 'when a touchpoint was made after this touchpoint'
      context 'when no touchpoints were made after this touchpoint'
    end
  end
end
