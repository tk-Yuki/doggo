class AddFollowedToRelationship < ActiveRecord::Migration[5.2]
  def change
    add_reference :relationships, :followed, foreign_key: true
  end
end
