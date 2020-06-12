class Guide < ApplicationRecord
  has_many :users, through: :user_guides
  has_many :likes
  has_many :comments
  has_many :user_guides
  has_many :pictures
end