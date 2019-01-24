class FeedSerializer < ActiveModel::Serializer
  attributes :id, :activities
  # has_many :activities, through: :feed_activities, serializer: ActivitySerializer

  def activities
    object.activities.map{|activity| ActivitySerializer.new(activity)}.shuffle
  end
end
