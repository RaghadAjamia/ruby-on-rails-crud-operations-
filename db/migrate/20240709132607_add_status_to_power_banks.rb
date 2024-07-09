class AddStatusToPowerBanks < ActiveRecord::Migration[7.1]
  def change
    add_column :power_banks, :status, :string
  end
end
