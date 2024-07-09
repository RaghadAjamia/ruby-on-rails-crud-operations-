class PowerBank < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  validates :status, inclusion: { in: %w[in_use available ] }
  validate :station_power_banks_within_limit, if: -> { locatable_type == 'Station' }
  private

  def station_power_banks_within_limit
    if locatable.is_a?(Station) && locatable.power_banks.size >= 10
      errors.add(:base, "Station cannot have more than 10 power banks")
    end
  end
end
