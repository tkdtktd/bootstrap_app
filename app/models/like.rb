class Like < ApplicationRecord
  belongs_to :user
  belongs_to :owner

  validates :user_id, {presence: true}
  validates :owner_id, {presence: true}
  
end
