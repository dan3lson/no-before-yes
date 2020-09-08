class Ahoy::Visit < ApplicationRecord
  self.table_name = 'ahoy_visits'
  self.implicit_order_column = :started_at

  has_many :events, class_name: 'Ahoy::Event'
  belongs_to :user, optional: true
end
