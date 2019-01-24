class Activity < ApplicationRecord
  belongs_to :subject, polymorphic: true
  belongs_to :object, polymorphic: true, optional: true
  belongs_to :actor, class_name: 'User'
  belongs_to :receiver, class_name: 'User', optional: true
  has_many :feed_activities
  has_many :feeds, through: :feed_activities

  after_create :populate_feeds

  private
  def populate_feeds
    friends_of_actor = self.actor.friends
    friends_of_actor.each do |friend|
      if self.receiver != nil
        if self.receiver == friend
          next
        end
      end
      friend.feed.activities.push(self)
    end
  end
end
