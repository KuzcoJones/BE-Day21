class CreateDailyHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_habits do |t|
      t.references :habit, null: false, foreign_key: true
      t.references :daily, null: false, foreign_key: true
      t.boolean :completed
      t.string :streak
      t.timestamps
    end
  end
end
