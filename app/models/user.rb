class User < ApplicationRecord
  # encrypts the user password
  has_secure_password

  # Model Association
  has_many :todos, foreign_key: :created_by
  # Validation
  validates_presence_of :name, :email, :password_digest
end
