class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :checkin
      t.date :checkout
      t.references :guest, foreign_key: true

      t.timestamps
    end
  end
end
