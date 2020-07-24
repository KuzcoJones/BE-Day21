class RemoveTitleFromDailies < ActiveRecord::Migration[6.0]
  def change
    remove_column :dailies, :completed
    remove_column :dailies, :title
  end
end
