class User < ApplicationRecord
  has_many :favourites, dependent: :destroy
  has_many :services, through: :favourites
  validates_presence_of :admin, :name
end
