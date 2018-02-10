class User < ApplicationRecord
  has_many :events
  has_many :organizations, through: :leadership

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def email
    "#{self.andrew_id}@andrew.cmu.edu"
  end
end
