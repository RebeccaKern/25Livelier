# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# Step 0: Create admin org
    org = Organization.new
    org.name = "admin_privileges"
    org.description = "available for staff, faculty, and site admins"
    org.save!

csv_text = File.read('org_primary.csv')
csv = CSV.parse(csv_text, :headers => true)
orgAffiliates = {}
count = 0
csv.each do |row|
  if count < 10
      count += 1
      org_name = row["organization"]
      sa = row[1].strip
      Organization.create(name: org_name)
      User.create(andrew_id: sa, role: "manager", password: "secret")
      Leadership.create(user_id:User.last.id, organization_id:Organization.last.id)
  else
    break
  end
end

#ALLIES, alokhande
#American Association for Aerosol Research, Tbrubaker
#Christians on Campus, yohanjo
#The Piper, bgerson