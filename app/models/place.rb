class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :posts, dependent: :destroy
  enum category: { dog_run: 0, dog_cafe: 1, restaurant: 2, park: 3, nature:4 }

  has_many :place_images, dependent: :destroy
  accepts_attachments_for :place_images, attachment: :image
  
  def self.all_to_hash
    all.map do |place|
      {
        id: place.id,
        latitude: place.latitude,
        longitude: place.longitude,
        name: place.name,
        image: Refile.attachment_url(place.place_images[0], :image)
      }
    end
  end

  def add_place_images(params)
    params.shift
    params.each do |param|
      place_image = PlaceImage.new(image: param)
      self.place_images << place_image
    end
  end
end
