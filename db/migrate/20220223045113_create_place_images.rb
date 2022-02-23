class CreatePlaceImages < ActiveRecord::Migration[5.2]
  def change
    create_table :place_images do |t|
      t.integer :place_id
      t.string :image_id
      t.index ["place_id"], name: "index_place_images_on_place_id"

      t.timestamps
    end
  end
end
