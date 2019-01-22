class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :block

  after_create :create_activity

  private

  def activity_for_block_author
    Activity.create(
      subject: self,
      name: "block_comment",
      checked: false,
      actor: self.user,
      receiver: self.block.user
    )
  end


end
