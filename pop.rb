require 'csv'

# Step 0: Create admin org
    org = Organization.new
    org.name = "admin_privileges"
    org.description = "available for staff, faculty, and site admins"
    org.save!

csv_text = File.read('org_primary.csv')
csv = CSV.parse(csv_text, :headers => true)
orgAffiliates = {}
csv.each do |row|
  org_name = row["organization"]
  sa = row[1].strip
  Organization.create(name: org_name)
  User.create(andrew_id: sa, role: "manager", password: "secret")
  Leadership.create(user_id:User.last.id, organization_id:Organization.last.id)
end
