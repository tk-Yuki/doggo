class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :posts, dependent: :destroy
  enum category: { dog_run: 0, dog_cafe: 1, restaurant: 2, park: 3, nature:4 }

  has_many :place_images, dependent: :destroy
  accepts_attachments_for :place_images, attachment: :image
end
