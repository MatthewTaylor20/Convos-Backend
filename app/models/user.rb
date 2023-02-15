class User < ApplicationRecord
  has_secure_password
  validates :email, email: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :messages
  has_many :group_users
  has_many :groups, through: :group_users
end
