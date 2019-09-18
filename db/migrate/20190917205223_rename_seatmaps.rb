class RenameSeatmaps < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :seat_maps, :seatmaps
  end

  def self.down
    rename_table :seatmaps, :seat_maps
  end
end