class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yacht

  alias_attribute :booker_id, :user_id
end
