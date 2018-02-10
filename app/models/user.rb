class User < ApplicationRecord
  has_secure_password

  has_many :events
  has_many :organizations, through: :leadership

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def email
    "#{self.andrew_id}@andrew.cmu.edu"
  end

  def self.authenticate(andrew_id,password)
    find_by_andrew_id(andrew_id).try(:authenticate, password)
  end

  ROLES = [['Administrator', :admin],['Organization Leader', :manager]]
  def role?(authorized_role)
    return false if role.nil?
    role.to_sym == authorized_role
  end

end
