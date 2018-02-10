class User < ApplicationRecord
  require 'open-uri'
  has_secure_password

  has_many :leaderships
  has_many :events
  has_many :organizations, through: :leaderships

  validate :has_andrew_id, on: :create
  validate :set_params_from_andrew, on: :create
  validate :user_is_not_a_duplicate, on: :create

  scope :alphabetical, -> { order('andrew_id') }
  scope :alphabetical_last, -> { order('last_name') }

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def email
    "#{self.andrew_id}@andrew.cmu.edu"
  end

  def self.authenticate(andrew_id,password)
    find_by_andrew_id(andrew_id).try(:authenticate, password)
  end

  ROLES = [['Administrator', :admin],['Organization Leader', :manager], ['CMU Affiliate', :general]]
  def role?(authorized_role)
    return false if role.nil?
    role.to_sym == authorized_role
  end

  def already_exists?
    User.where(andrew_id: self.andrew_id).size == 1
  end

  private

  def set_params_from_andrew
    json = JSON.parse(open("https://apis.scottylabs.org/directory/v1/andrewID/#{self.andrew_id}").read)
    if json["affiliation"] == "Alumni"
      errors.add(:user, "is an alumni and should not have the ability to create an account.")
    end
    self.first_name = json["first_name"]
    self.last_name = json["last_name"]
    if json["affiliation"] == "Faculty" || json["affiliation"] == "Staff"
      self.role = "manager"
    end
    puts self.role
    if self.role == ""
      self.role = "general"
    end
  end

  def has_andrew_id
    begin
      open("https://apis.scottylabs.org/directory/v1/andrewID/#{self.andrew_id}")
    rescue
      errors.add(:user, "does not currently have an andrew_id at CMU")
    end
  end

  def user_is_not_a_duplicate
    if self.already_exists? 
      errors.add(:andrew_id, "already exists for a current user")
    end
  end

end
