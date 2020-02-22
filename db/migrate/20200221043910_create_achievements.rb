class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.string :name, null: false
      t.integer :criteria, null: false

      t.timestamps
    end
  end
end
