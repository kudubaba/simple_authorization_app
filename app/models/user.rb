class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :username, length: {minimu:6}
  has_secure_password
end
