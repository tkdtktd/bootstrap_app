class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :users, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true

  def users
    return User.where(owner_id: self.id)
  end

  def likes
    return Like.where(owner_id: self.id)
  end
end
