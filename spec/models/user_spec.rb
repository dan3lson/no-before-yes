# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:email) }
    subject { create(:user) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
