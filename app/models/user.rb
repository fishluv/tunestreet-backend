# == Schema Information
#
# Table name: users
#
#  id                      :bigint           not null, primary key
#  email                   :string           not null
#  username                :string
#  login_token             :string
#  login_token_valid_until :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :username, length: { in: 1..24 }
end
