class AddCoordinatesToYachts < ActiveRecord::Migration[7.1]
  def change
    add_column :yachts, :latitude, :float
    add_column :yachts, :longitude, :float
  end
end
