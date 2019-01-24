class ChannelFollower < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :channel

  after_create :create_activity

  private

  def create_activity
    Activity.create(
      subject: self.channel,
      object: self.channel.users[0],
      name: "FOLLOW_CHANNEL",
      checked: false,
      actor: self.follower,
    )
  end

end
