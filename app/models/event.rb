class Event < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :organization

  scope :for_room, ->(room_id) { where("room_id = ?", room_id) }
  scope :for_user, ->(user_id) { where("user_id = ?", user_id) }
  scope :upcoming, -> { where('date >= ?', Date.current) }
  scope :past, -> { where('date < ?', Date.current) }

end
