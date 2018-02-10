class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :location_address
      t.integer :max_capacity
      t.string :room_type
      t.string :description
      t.boolean :reservable, default: true
      t.references :building, foreign_key: true

      t.timestamps
    end
  end
end
