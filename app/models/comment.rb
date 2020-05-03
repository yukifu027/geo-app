class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :guide

  validates :text, presence: true
end