class AddPublishedToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :published, :boolean
  end
end
