class Rating < ApplicationRecord
  enum :type, [:quality, :difficulty]
  enum :entity_type, [:chart, :song, :version]

  self.inheritance_column = "dummy"
end
