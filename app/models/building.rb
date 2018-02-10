class Building < ApplicationRecord
  has_many :rooms
  scope :alphabetical, -> { order('name') }
end
