class AddUserToYachts < ActiveRecord::Migration[7.1]
  def change
    add_reference :yachts, :user, null: false, foreign_key: true
  end
end
