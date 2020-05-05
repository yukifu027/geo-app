class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :guide

  validates :text, presence: true
  default_scope -> { order(created_at: :desc) }
end