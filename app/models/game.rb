class Game < ApplicationRecord
  validates_presence_of :name
  has_many :playthroughs
end
