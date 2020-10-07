# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  describe 'attributes' do
    it do
      is_expected.to define_enum_for(:status).
        with_values(%i(unpublished published upcoming))
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:publisher) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:bg_color) }
    it do
      is_expected.to(
        validate_presence_of(:icon).
        with_message('must have a Font Awesome icon name')
      )
    end
    it { is_expected.to validate_presence_of(:title) }
    subject { create(:blog_post) }
    it { is_expected.to validate_uniqueness_of(:title).case_insensitive }

    describe 'publish_on' do
      context 'when status is unpublished' do
        before { allow(subject).to receive(:published?).and_return(false) }

        it { is_expected.not_to validate_presence_of(:publish_on) }
      end

      context 'when status is published' do
        before { allow(subject).to receive(:published?).and_return(true) }

        it { is_expected.to validate_presence_of(:publish_on) }
      end
    end
  end

  describe 'callbacks' do
    describe 'titleize_title'
  end
end
