class Yacht < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  belongs_to :user
  has_one_attached :photo

  alias_attribute :owner_id, :user_id

  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  geocoded_by :port
  after_validation :geocode, if: :will_save_change_to_port?
end
