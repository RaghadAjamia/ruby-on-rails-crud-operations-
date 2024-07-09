class CreateWarehouses < ActiveRecord::Migration[7.1]
  def change
    create_table :warehouses do |t|
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
