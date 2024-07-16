class DropFlatsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :flats
  end
end
