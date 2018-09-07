class User < ApplicationRecord
  validates :name, presence: true
  validates :age, uniqueness: true
end
