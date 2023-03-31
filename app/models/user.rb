class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :username, length: { in: 1..24 }
end
