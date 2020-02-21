class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :username, uniqueness: true
  validates_presence_of :username

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
