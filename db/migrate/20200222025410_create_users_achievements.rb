class CreateUsersAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :users_achievements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :achievement, null: false, foreign_key: true
    end
  end
end
