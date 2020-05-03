class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  has_many :guides, through: :user_guides
  has_many :comments
  has_many :user_guides

  validates :name, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader
end
