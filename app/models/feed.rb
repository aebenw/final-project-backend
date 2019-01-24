class Feed < ApplicationRecord
  belongs_to :user
  has_many :feed_activities
  has_many :activities, through: :feed_activities
end
