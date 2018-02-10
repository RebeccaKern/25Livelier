class Organization < ApplicationRecord
  has_many :users, through: :leadership
end
