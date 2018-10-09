class Post < ApplicationRecord

  belongs_to :user
  belongs_to :owner

  validates :content, length: {maximum: 100}

  def owner
    Owner.find_by(id: self.owner_id)
  end
end
