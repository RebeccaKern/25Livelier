class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :andrew_id
      t.string :role
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.boolean :active

      t.timestamps
    end
  end
end
