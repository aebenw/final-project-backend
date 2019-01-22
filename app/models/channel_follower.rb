class ChannelFollower < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :channel

  after_create :create_activity

  private

  def create_activity
    Activity.create(
      subject: self.channel,
      name: "FOLLOW_CHANNEL",
      check: false,
      actor: self.follower,
      receiver: self.channel.users[0]
    )
  end

end
