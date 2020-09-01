class User < ApplicationRecord
  validates_presence_of :admin, :name
end
