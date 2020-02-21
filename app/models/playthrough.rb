class Playthrough < ApplicationRecord
  belongs_to :game
  belongs_to :user

  before_create :set_score

  private

  def set_score
    self.score = rand(1000)
  end
end
