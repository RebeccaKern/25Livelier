class CreateLeaderships < ActiveRecord::Migration[5.1]
  def change
    create_table :leaderships do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
