class AddApartmentIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :apartment_id, :integer
  end
end
