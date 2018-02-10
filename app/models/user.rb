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

  def self.authenticate(email,password)
    find_by_email(email).try(:authenticate, password)
  end

  ROLES = [['Administrator', :admin],['Organization Leader', :manager]]
  def role?(authorized_role)
    return false if role.nil?
    role.to_sym == authorized_role
  end

end
