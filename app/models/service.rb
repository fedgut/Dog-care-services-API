class Service < ApplicationRecord
  has_many :favourites
  has_many :users, through: :favourites
  validates_presence_of :title, :description, :image_url, :price
end
