class Fix < ActiveRecord::Migration[7.1]
  def change
    remove_column :yachts, :integer
    remove_column :yachts, :price_per_hour
  end
end
