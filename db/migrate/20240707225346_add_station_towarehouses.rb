class AddStationTowarehouses < ActiveRecord::Migration[7.1]
  def change
    add_reference :warehouses, :station,  foreign_key: true

  end
end
