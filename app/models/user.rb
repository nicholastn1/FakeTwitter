class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, presence: true

  # User has many posts
  has_many :posts

  # User-Follower relation
  # Users who follow this user ( Using user followed id )
  has_many :followers_subscriptions, foreign_key: :followed_id, class_name: 'Subscription'
  # User who is being followed has many followers ( This followers it's being getting from followed_by )
  has_many :followers, through: :followers_subscriptions, source: :followed_by

  # Users who this user follow
  has_many :following_subscriptions, foreign_key: :followed_by_id, class_name: 'Subscription'
  # User follow many users ( Getting users that I follow )
  has_many :following, through: :following_subscriptions, source: :followed

end
