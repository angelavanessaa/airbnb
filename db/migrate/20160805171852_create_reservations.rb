class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true
      t.references :listing, index: true
      t.date :check_in_date
      t.date :check_out_date
      t.integer :number_of_people

      t.timestamps
    end
  end
end
