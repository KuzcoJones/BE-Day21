class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.integer :difficulty
      t.text :note
      t.boolean :completed
      t.string :streak
      t.boolean :good

      t.timestamps
    end
  end
end
