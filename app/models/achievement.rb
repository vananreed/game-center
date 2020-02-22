class Achievement < ApplicationRecord
  validates_presence_of :name, :criteria

  def criteria_met?(user)
    case criteria
    when 1
      user.last_three_games_the_same?
    when 2
      user.total_score > 5000
    when 3
      user.total_different_games_played >= 3
    end
  end
end
