class Channel < ApplicationRecord
  has_many :user_channels
  has_many :channel_blocks
  has_many :channel_followers
  has_many :followers, through: :channel_followers
  has_many :users, through: :user_channels
  has_many :blocks, through: :channel_blocks

  after_create :create_activity

  private

  def create_activity
    Activity.create(
      subject: self,
      name: "CREATE_CHANNEL",
      checked: true,
      user: self.users[0]
    )
  end
end
