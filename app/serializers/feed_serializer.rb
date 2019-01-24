class FeedSerializer < ActiveModel::Serializer
  attributes :id, :activities

  def activities
    object.activities.map{|activity| ActivitySerializer.new(activity)}.shuffle
  end
  
end
