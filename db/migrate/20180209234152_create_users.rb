class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :andrew_id
      t.string :role

      t.timestamps
    end
  end
end
