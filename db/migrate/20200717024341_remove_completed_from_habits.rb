class RemoveCompletedFromHabits < ActiveRecord::Migration[6.0]
  def change
    remove_column :habits, :completed, :boolean
  end
end
