class CreateHabitTags < ActiveRecord::Migration[6.0]
  def change
    create_table :habit_tags do |t|
      t.references :habit, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end


# t.references :habit, null: false, foreign_key: true
