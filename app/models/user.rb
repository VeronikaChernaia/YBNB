class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :yachts, dependent: :destroy

  has_one_attached :profile_picture

  # Optional: Add validation for the image type
  validates :profile_picture, content_type: [:png, :jpg, :jpeg], size: { less_than: 5.megabytes , message: 'is not given between size' }
end
