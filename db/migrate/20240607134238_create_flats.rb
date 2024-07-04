class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :title
      t.text :description
      t.string :address
      t.float :price

      t.timestamps
    end
  end
end
