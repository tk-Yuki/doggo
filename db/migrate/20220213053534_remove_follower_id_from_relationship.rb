class RemoveFollowerIdFromRelationship < ActiveRecord::Migration[5.2]
  def change
    remove_reference :relationships, :follower_id, foreign_key: true
  end
end
