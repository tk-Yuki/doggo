class Post < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :image
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
