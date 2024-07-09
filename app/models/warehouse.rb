class Warehouse < ApplicationRecord
  belongs_to :location
  has_many :stations
  has_many :power_banks, as: :locatable
  
  validates :name, presence: true
  validates :location, presence: true

end
