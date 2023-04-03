# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  email                   :string           not null
#  login_token             :string
#  login_token_valid_until :datetime
#  username                :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_many :ratings

  authenticates_with_sorcery!

  validates :username, length: { in: 1..24 }, if: -> { username.present? }
end
