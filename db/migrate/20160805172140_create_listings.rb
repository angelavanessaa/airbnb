class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user, index: true
      t.string :property_type
      t.string :bed_count
      t.string :max_people
      t.integer :bathroom_count
      t.string :bathroom_type
      t.string :country
      t.text :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :price_per_night
      t.date :date_availability_start
      t.date :date_availability_end

      t.timestamps null: false
    end
  end
end
