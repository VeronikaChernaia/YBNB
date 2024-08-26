class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :yacht, null: false, foreign_key: true
      t.integer :rating
      t.text :content
      t.date :date_reviewed

      t.timestamps
    end
  end
end
