class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true

  has_many :challenges, dependent: :destroy
  has_many :likes
  has_many :liked_challenges, through: :likes, source: :challenge

  has_many :followed_user_relationships,
   foreign_key: :follower_id,
   class_name: "FollowingRelationship",
   dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships 

  has_many :follower_relationships, 
    foreign_key: :followed_user_id,
     class_name: "FollowingRelationship", 
     dependent: :destroy
  has_many :followers, through: :follower_relationships
  
  def timeline_challenges
    Challenge.where(user_id: followed_user_ids + [id] )
  end

  def unfollow(user)
   followed_users.delete(user)
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end

  def follow(user)
    followed_users << user
  end

  def like(challenge)
    liked_challenges << challenge
  end

  def unlike(challenge)
    liked_challenges.destroy(challenge)
  end

  def liked?(challenge)
    liked_challenge_ids.include?(challenge.id)
  end

  def to_param
    username
  end

end
