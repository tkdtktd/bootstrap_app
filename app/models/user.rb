class User < ApplicationRecord

  belongs_to :owner
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50}
  validates :age, presence: true
  validates :owner_id, presence: true

  mount_uploaders :avatar, AvatarUploader
  serialize :avatar,JSON unless Rails.env.production?

  def owner
    return Owner.find(self.owner_id)
  end

  def likes
    return Like.where(user_id: self.id)
  end
end