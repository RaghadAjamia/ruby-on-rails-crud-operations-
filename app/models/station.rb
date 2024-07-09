class Station < ApplicationRecord
  belongs_to :location
  belongs_to :warehouse
  has_many :power_banks, as: :locatable

  validates :name, presence: true
  validates :status, inclusion: { in: ['online', 'offline'] }
end
