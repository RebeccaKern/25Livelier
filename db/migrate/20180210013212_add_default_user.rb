class AddDefaultUser < ActiveRecord::Migration[5.1]
    
  def up
    admin = User.new
    admin.andrew_id = "rkern"
    admin.password = "secret"
    admin.password_confirmation = "secret"
    admin.role = "admin"
    admin.save
  end

end

