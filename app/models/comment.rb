class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :block

  after_create :create_activity

  private

  def create_activity

    Activity.create(
      subject: self,
      object: self.block,
      name: "BLOCK_COMMENT",
      checked: false,
      actor: self.user,
      receiver: self.block.user
    )

  end


end
