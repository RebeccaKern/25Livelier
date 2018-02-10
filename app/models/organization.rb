class Organization < ApplicationRecord
  has_many :leaderships
  has_many :users, through: :leaderships
  scope :alphabetical, -> { order('name') }
  scope :by_user, -> (user_id) { joins(:leaderships).where("user_id = ?", user_id) }
end
