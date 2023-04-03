# == Schema Information
#
# Table name: ratings
#
#  id          :bigint           not null, primary key
#  type        :integer          not null
#  entity_type :integer          not null
#  entity_id   :string           not null
#  value       :decimal(3, 2)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Rating < ApplicationRecord
  enum :type, [:quality, :difficulty]
  enum :entity_type, [:chart, :song, :version]

  self.inheritance_column = "dummy"

  validates :value, comparison: { greater_than_or_equal_to: BigDecimal("0.5") }
  validates :value, comparison: { less_than_or_equal_to: 5 }
end
