class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :username, length: {minimum:6}
  has_secure_password
end
