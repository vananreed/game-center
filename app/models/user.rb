class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :username, uniqueness: true
  validates_presence_of :username

  has_many :playthroughs

  def total_score
    playthroughs.sum(:score)
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
