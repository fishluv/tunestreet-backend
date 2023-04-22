# == Schema Information
#
# Table name: ratings
#
#  id          :bigint           not null, primary key
#  entity_type :integer          not null
#  type        :integer          not null
#  value       :decimal(3, 2)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  entity_id   :string           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_ratings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Rating < ApplicationRecord
  enum :type, [:quality, :difficulty]
  enum :entity_type, [:chart, :song, :version]

  self.inheritance_column = "dummy"

  belongs_to :user

  validates :value, comparison: { greater_than_or_equal_to: BigDecimal("0.5") }, if: -> { type == :quality }
  validates :value, comparison: { less_than_or_equal_to: BigDecimal("5.0") }, if: -> { type == :quality }

  validates :value, comparison: { greater_than_or_equal_to: BigDecimal("-1.25") }, if: -> { type == :difficulty }
  validates :value, comparison: { less_than_or_equal_to: BigDecimal("1.25") }, if: -> { type == :difficulty }

  def val
    format("%0.2f", value)
  end
end
