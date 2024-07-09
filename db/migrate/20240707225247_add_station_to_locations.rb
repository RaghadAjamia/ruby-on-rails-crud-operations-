class AddStationToLocations < ActiveRecord::Migration[7.1]
  def change
    add_reference :locations, :station,  foreign_key: true
  end
end
