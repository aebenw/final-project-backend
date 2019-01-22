class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  # The following method finds all the relationships a user is connected to
  scope :friends, -> (user) do
  where("(relationships.followed_id = ? OR relationships.follower_id = ?)", user.id, user.id)
  end

  after_create :create_activity

  private

  def create_activity
    Activity.create(
      subject: self,
      name: "FRIENDSHIP",
      checked: false,
      actor: self.follower,
      receiver: self.followed
    )
  end


end
