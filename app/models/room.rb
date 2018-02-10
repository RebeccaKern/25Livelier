class Room < ApplicationRecord
  belongs_to :building
  scope :alphabetical, -> { order('location_address') }

  def full_name
    "#{self.building.name} #{self.location_address}"
  end 
end
