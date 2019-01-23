class User < ApplicationRecord
  has_many :user_channels
  has_many :channel_followers
  has_many :channels, through: :user_channels
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :blocks, dependent: :destroy

  has_many :followed_channels, class_name: "ChannelFollower", foreign_key: "follower_id"

  #Self joining logic for a user to user friendship

  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "follower_id",
                                dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                foreign_key: "followed_id",
                                dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :activities, class_name: "Activity", foreign_key: :actor_id
  has_many :notifications, class_name: "Activity", foreign_key: :receiver

  #active_storage profile pic
  has_one_attached :profile
  has_one :feed
  has_secure_password

  #validations
  validates :name, presence: true, on: :create
  validates :email, presence: true, on: :create
  validates :email, uniqueness: true, on: :create
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 4 }

  after_create :create_and_populate_feed
  def friends
    all_friends = followers + following
    friends_wo_user = all_friends.select{|user| user.id !=  self.id }
    return friends_wo_user
  end

  private
  def create_and_populate_feed
    Feed.find_or_create_by(user_id: self.id)
  end

end
