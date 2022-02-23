class PlaceImage < ApplicationRecord
  belongs_to :place
  attachment :image
end
