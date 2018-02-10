class RemoveTimeFromEvent < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :time, :datetime
  end
end
