class PowerBank < ApplicationRecord
  belongs_to :locatable, polymorphic: true

  validates :status, inclusion: { in: %w[in_use available in_repair] }

end
