class CreateDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :dailies do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :completed
      t.text :description

      t.timestamps
    end
  end
end
