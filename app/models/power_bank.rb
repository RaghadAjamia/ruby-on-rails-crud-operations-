class PowerBank < ApplicationRecord
  belongs_to :locatable, polymorphic: true
end
