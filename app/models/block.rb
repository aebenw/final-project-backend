class Block < ApplicationRecord
  has_many :channel_blocks
  has_many :channels, through: :channel_blocks
  has_many :comments
  belongs_to :user

  #PDF/IMAGE attatched to block through ActiveStorage
  has_one_attached :file

  after_create :create_activity

  def addActivity(channel_author)
    if self.block.user == channel_author
      activity_for_own_block_channel
    else
      activity_for_another_channel(channel_author)
    end

  end

  # If one adds a block to one's own channel
    # Just render action to friends' feeds

  def activity_for_own_block_channel
    Activity.create(
      subject: self.block,
      object: self.channel,
      name: "ADD_BLOCK_TO_OWN_CHANNEL",
      checked: true,
      actor: self.users[0]
    )
  end

  private

  # If somebody adds a block to someone's channel
    # Notify the author of the channel
    # Render to friend's feeds
      # That author of block added to x channel

  def activity_for_another_channel(channel_author)
    Activity.create(
      subject: self.block,
      object: self.channel,
      name: "ADD_BLOCK_TO_OTHER_CHANNEL",
      checked: false,
      actor: self.block.user,
      receiver: channel_author
    )
  end

end
