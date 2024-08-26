class Yacht < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  alias_attribute :owner_id, :user_id

  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
