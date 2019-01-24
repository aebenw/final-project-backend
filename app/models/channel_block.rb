class ChannelBlock < ApplicationRecord
  belongs_to :channel
  belongs_to :block

  after_create :add_activity

  private

  def add_activity
    if self.block.user == self.channel.users[0]
      self.block.activity_for_own_block_channel
    else
      activity_for_another_block
    end

  end

  # If a user adds someone else's block to their channel
    # Notify the author of the block
    # Render to Friend's feeds
      #That x added y's block to x's channel

  def activity_for_another_block
    Activity.create(
      subject: self.block,
      object: self.channel,
      name: "ADD_OTHER_BLOCK_TO_CHANNEL",
      checked: false,
      actor: self.channel.users[0],
      receiver: self.block.user
    )
  end

end
