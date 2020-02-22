class Playthrough < ApplicationRecord
  belongs_to :game
  belongs_to :user

  before_create :set_score
  after_create :check_achievements

  private

  def set_score
    self.score = rand(1000)
  end

  def check_achievements
    Achievement.find_each do |achievement|
      next if !achievement.criteria_met?(user) || user.users_achievements.exists?(achievement_id: achievement.id)

      user.users_achievements.create(achievement: achievement)
    end
  end
end
