class CreateSeatMaps < ActiveRecord::Migration[5.1]
  def change
    create_table :seat_maps do |t|
      t.string :title
      t.text :description
      t.string :rows
      t.string :seats

      t.timestamps
    end
  end
end
