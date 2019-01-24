class Block < ApplicationRecord
  has_many :channel_blocks
  has_many :channels, through: :channel_blocks
  has_many :comments
  belongs_to :user

  #PDF/IMAGE attatched to block through ActiveStorage
  has_one_attached :file

  def add_activity(channel_id)
    channel = Channel.find(channel_id)
    if self.user == channel.users[0]
      activity_for_own_block_channel(channel)
    else
      activity_for_another_channel(channel)
    end

  end

  # If one adds a block to one's own channel
    # Just render action to friends' feeds

  def activity_for_own_block_channel(channel)
    Activity.create(
      subject: self,
      object: channel,
      name: "ADD_BLOCK_TO_OWN_CHANNEL",
      checked: true,
      actor: self.user,
    )
  end

  private

  # If somebody adds a block to someone's channel
    # Notify the author of the channel
    # Render to friend's feeds
      # That author of block added to x channel

  def activity_for_another_channel(channel)
    Activity.create(
      subject: self,
      object: channel,
      name: "ADD_BLOCK_TO_OTHER_CHANNEL",
      checked: false,
      actor: self.user,
      receiver: channel.users[0]
    )
  end

end
