class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :place_id
      t.string :image_id
      t.text :body

      t.timestamps
    end
  end
end
