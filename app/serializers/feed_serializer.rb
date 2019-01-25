class FeedSerializer < ActiveModel::Serializer
  attributes :id, :activities

  def activities
    arr = []
    while arr.length <= 5
      feed_activity = FeedActivity.where(feed_id: object.id, seen: false).sample(5)

      if feed_activity == nil
        break
      end
      feed_activity.map{|activity|
        activity.seen = true
        arr.push(ActivitySerializer.new(activity.activity))
      }
    end

    arr
  end

end
