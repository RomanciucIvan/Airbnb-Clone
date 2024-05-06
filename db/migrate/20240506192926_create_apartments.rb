class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :title
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
