class User < ApplicationRecord
  has_secure_password
  has_many :favourites, dependent: :destroy
  has_many :services, through: :favourites
  validates_presence_of :name, :email, :password_digest
end
