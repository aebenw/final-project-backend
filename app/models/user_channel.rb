class UserChannel < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  after_create :create_activity

  private

  def create_activity
    Activity.create(
      subject: self.channel,
      name: "CREATE_CHANNEL",
      checked: true,
      actor: self.channel.users[0]
    )
  end
  
end
