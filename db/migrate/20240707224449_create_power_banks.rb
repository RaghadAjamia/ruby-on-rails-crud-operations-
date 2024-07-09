class CreatePowerBanks < ActiveRecord::Migration[7.1]
  def change
    create_table :power_banks do |t|
      t.string :serial_number
      t.references :locatable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
