class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.integer :listing_number
      t.decimal :listing_price
      t.string :summary
      t.datetime :close_date

      t.timestamps
    end
  end
end
