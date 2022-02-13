class RemoveFollowedIdFromRelationship < ActiveRecord::Migration[5.2]
  def change
    remove_reference :relationships, :followed_id, foreign_key: true
  end
end
