class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable

  validates :username, uniqueness: true
  validates_presence_of :username

  has_many :playthroughs
  has_many :users_achievements, dependent: :destroy

  def total_score
    playthroughs.sum(:score)
  end

  def last_playthroughs(num)
    playthroughs.last(num)
  end

  def last_three_games_the_same?
    last_playthroughs(3).pluck(:game_id).uniq.length == 1
  end

  def total_different_games_played
    playthroughs.pluck(:game_id).uniq.length
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
