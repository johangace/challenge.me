class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true

  has_many :challenges, dependent: :destroy
  has_many :likes
  has_many :liked_challenges, through: :likes, source: :challenge

  def like(challenge)
    liked_challenges << challenge
  end

  def unlike(challenge)
    liked_challenges.destroy(challenge)
  end

  def liked?(challenge)
    liked_challenge_ids.include?(challenge.id)
  end

end
