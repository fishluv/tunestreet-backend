class Rating < ApplicationRecord
  enum :type, [:quality, :difficulty]
  enum :entity_type, [:chart, :song, :version]

  self.inheritance_column = "dummy"

  validates :value, comparison: { greater_than_or_equal_to: BigDecimal("0.5") }
  validates :value, comparison: { less_than_or_equal_to: 5 }
end
