class Place < ApplicationRecord
  has_many :posts, dependent: :destroy
  attachment :image
end
