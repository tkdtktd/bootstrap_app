class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :users, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true

  def users
    User.where(owner_id: self.id)
  end

  def likes
    Like.where(owner_id: self.id)
  end
end
