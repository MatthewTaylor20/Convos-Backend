class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :messages
  has_many :group_users
  has_many :groups, through: :group_users
end
