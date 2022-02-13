class AddFollowerToRelationship < ActiveRecord::Migration[5.2]
  def change
    add_reference :relationships, :follower, foreign_key: true
  end
end
