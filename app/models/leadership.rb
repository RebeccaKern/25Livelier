class Leadership < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  scope :by_user, -> (user_id) { where("user_id = ?", user_id) }
end
