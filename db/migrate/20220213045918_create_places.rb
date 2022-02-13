class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.integer :category
      t.string :image_id
      t.string :price
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :detail

      t.timestamps
    end
  end
end
