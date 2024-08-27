class Fix2 < ActiveRecord::Migration[7.1]
  def change
    add_column :yachts, :price_per_hour, "integer"
  end
end
