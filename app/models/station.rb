class Station < ApplicationRecord
  belongs_to :location
  belongs_to :warehouse
  has_many :power_banks, as: :locatable

  validates :name, presence: true
  validates :status, inclusion: { in: ['online', 'offline'] }

  private

  def power_banks_count_within_limit
    if power_banks.size > 10
      errors.add(:power_banks, "exceeds the limit of 10")
    end
  end
end
