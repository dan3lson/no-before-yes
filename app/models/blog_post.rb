# frozen_string_literal: true

class BlogPost < ApplicationRecord
  extend FriendlyId

  has_rich_text :content

  belongs_to :publisher, foreign_key: :user_id, class_name: :User

  enum status: { unpublished: 0, published: 1, upcoming: 2 }

  validates :bg_color, presence: true
  validates :icon, presence: { message: 'must have a Font Awesome icon name' }
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :publish_on, presence: true, if: :published?

  before_save :titleize_title

  scope :latest, -> { order(publish_on: :desc)}

  friendly_id :title, use: :slugged

  private

  def titleize_title
    self.title = title.titleize
  end
end
