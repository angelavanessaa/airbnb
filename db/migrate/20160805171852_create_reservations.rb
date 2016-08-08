class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true
      t.references :listing, index: true
      t.integer :reservation_duration
      t.integer :number_of_people

      t.timestamps
    end
  end
end
