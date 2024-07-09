class Location < ApplicationRecord
    has_many :warehouses
    validates :address, presence: true
end
