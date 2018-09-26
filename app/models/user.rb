class User < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true

  mount_uploader :avatar, AvatarUploader
end
