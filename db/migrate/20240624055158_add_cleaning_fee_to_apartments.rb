class AddCleaningFeeToApartments < ActiveRecord::Migration[7.0]
  def change
    add_column :apartments, :cleaning_fee, :integer, default: 0
  end
end
