class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string  :apartment_id
      t.integer :price
      t.text  :status, default: 0
      t.timestamps
    end
  end
end
