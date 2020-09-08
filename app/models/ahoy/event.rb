class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"
  self.implicit_order_column = :time

  belongs_to :visit
  belongs_to :user, optional: true
end
