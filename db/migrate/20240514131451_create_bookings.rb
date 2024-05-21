class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string  :user_id
      t.string  :apartment_id
      t.integer :price
      t.text  :status 
      t.timestamps
    end
  end
end
