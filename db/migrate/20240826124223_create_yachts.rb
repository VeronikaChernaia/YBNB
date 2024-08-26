class CreateYachts < ActiveRecord::Migration[7.1]
  def change
    create_table :yachts do |t|
      t.text :title
      t.text :brand
      t.string :price_per_hour
      t.string :integer
      t.text :description
      t.text :port

      t.timestamps
    end
  end
end
