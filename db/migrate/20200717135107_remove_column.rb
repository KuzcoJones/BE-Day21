class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :habits, :daily_id, :integer
  end
end
