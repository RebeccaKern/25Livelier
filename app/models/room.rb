class Room < ApplicationRecord
  belongs_to :building
  scope :alphabetical, -> { order('location_address') }
  scope :for_dh, -> { joins(:building).where('name LIKE ?', 'Doherty Hall') }
  scope :for_bh, -> { joins(:building).where('name LIKE ?', 'Baker Hall') }
  scope :for_ph, -> { joins(:building).where('name LIKE ?', 'Porter Hall') }
  scope :for_weh, -> { joins(:building).where('name LIKE ?', 'Wean Hall') }

  def full_name
    "#{self.building.name} #{self.location_address}"
  end

  def events_for_room
    Event.where(room_id: self.id);
  end 
end
