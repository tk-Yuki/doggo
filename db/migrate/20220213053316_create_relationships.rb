class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :follower_id, foreign_key: true
      t.references :followed_id, foreign_key: true

      t.timestamps
    end
  end
end
